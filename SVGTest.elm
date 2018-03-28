module SVGTest exposing (createBranch)

import Html
import Svg exposing (..)
import Svg.Attributes exposing (..)
import String.Format exposing (format2, format4, format6)

branch : Html.Html msg
branch =
    svg [width "500px", height "500px", viewBox "0 0 500 500", version "1.1"]
      [ Svg.g [stroke "none", strokeWidth "1", fill "none", fillRule "evenodd", strokeLinecap "round"] tree ]

path = someWhatTallBranch 20 400
path2 = someWhatTallBranch 70 300
path3 = someWhatTallBranch 120 200

tree = branches 4 20 400
branches n x y = case n of
  0 -> []
  _ -> [someWhatTallBranch x y] ++ branches (n-1) (x+50) (y-60)

someWhatTallBranch x y = createBranch x y (x+branchHorizontalSpread) (y-branchVerticalSpread) "5" "#BD10E0"

createBranch x1 y1 x2 y2 width color =
    Svg.path [
    d (branchVector x1 y1 x2 y2 10 50),
    stroke color, strokeWidth width] []

branchHorizontalSpread = 50
branchVerticalSpread = 100

{-- Creates a branch with the given coordinates and size

                         * (x2, y2)
                         |
                         |  - upperBranchLength
                        /
                       /
lowerBranchLength  -  |
                      |
                      *(x1, y1)

--}
branchCurvature = 15
branchVector x1 y1 x2 y2 lowerBranchLength upperBranchLength =
  let
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

main = branch
