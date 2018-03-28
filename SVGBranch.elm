module SVGBranch exposing (createBranch)

import Html
import Svg exposing (..)
import Svg.Attributes exposing (..)
import String.Format exposing (format2, format4, format6)

{-- Creates an SVG vector that looks like a branch. The usage of the given
    coordinates and dimensions are described in the below graphic

                           *
                           |   <- upperBranchLength
                       ^   |
branchVerticalSpread - |  /
                       | /
                        |--->    branchHorizontalSpread
  lowerBranchLength ->  |
                        *(x1, y1)

--}
createBranch x y branchHorizontalSpread branchVerticalSpread lowerBranchLength upperBranchLength branchCurvature width color =
    Svg.path [
    d (branchVector x y branchHorizontalSpread branchVerticalSpread lowerBranchLength upperBranchLength branchCurvature),
    stroke color, strokeWidth width] []

branchVector x1 y1 branchHorizontalSpread branchVerticalSpread lowerBranchLength upperBranchLength branchCurvature =
  let
    x2 = (x1+branchHorizontalSpread)
    y2 = (y1-branchVerticalSpread)
    controlPoint3 = svgControlPoint x2 y2 x2 y2 x2 y2
    controlPoint2 = svgControlPoint x1 (y1 - lowerBranchLength - branchCurvature) x2 (y2 + upperBranchLength + branchCurvature) x2 (y2 + upperBranchLength)
    controlPoint1 = svgControlPoint x1 y1 x1 y1 x1 (y1 - lowerBranchLength)
    startingPoint = svgMovePoint x1 y1
    vector = format4 "{1} {2} {3} {4}"
      (startingPoint, controlPoint1, controlPoint2, controlPoint3)
  in
    vector

svgMovePoint x y =
  let
      xs  = toString x
      ys  = toString y
  in
      format2 "M{1},{2}" (xs, ys)

svgControlPoint x1 y1 x2 y2 x y =
  let
      x1s = toString x1
      y1s = toString y1
      x2s = toString x2
      y2s = toString y2
      xs  = toString x
      ys  = toString y
  in
      format6 "C{1},{2} {3},{4} {5},{6}" (x1s, y1s, x2s, y2s, xs, ys)
