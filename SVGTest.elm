module SVGTest exposing (createBranch)

import Html
import Svg exposing (..)
import Svg.Attributes exposing (..)
import String.Format exposing (format2, format4, format6)

branch : Html.Html msg
branch =
    svg [width "500px", height "500px", viewBox "0 0 57 500", version "1.1"]
      [ Svg.g [stroke "none", strokeWidth "1", fill "none", fillRule "evenodd", strokeLinecap "round"] [path] ]

path = createBranch 20 190 70 3 "5" "#BD10E0"

createBranch x1 y1 x2 y2 width color =
    Svg.path [
    d (branchVector x1 y1 x2 y2),
    stroke color, strokeWidth width] []

lowerBranchLength = 30
upperBranchLength = 120

branchVector x1 y1 x2 y2 =
  let
    startingPoint = svgMovePoint x1 y1
    controlPoint1 = svgControlPoint x1 y1 x1 y1 x1 (y1 - lowerBranchLength)
    controlPoint2 = svgControlPoint x1 (y1 - lowerBranchLength - 15) x2 (y2 + upperBranchLength + 15) x2 (y2 + upperBranchLength)
    controlPoint3 = svgControlPoint x2 y2 x2 y2 x2 y2
    x1s = toString x1
    y1s = toString y1
    x2s = toString x2
    y2s = toString y2
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
