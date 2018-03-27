import Html
import Svg exposing (..)
import Svg.Attributes exposing (..)
import String.Format exposing (format4)

branch : Html.Html msg
branch =
    svg [width "500px", height "272px", viewBox "0 0 57 272", version "1.1"]
      [ Svg.g [stroke "none", strokeWidth "1", fill "none", fillRule "evenodd", strokeLinecap "round"] [path] ]


path = createBranch 20 190
createBranch x1 y1 =
    Svg.path [
    d (branchVector x1 y1 0 0),
    stroke "#BD10E0", strokeWidth "5"] []

branchVector x1 y1 x2 y2 =
  let
    x1s = toString x1
    y1s = toString y1
    x2s = toString x2
    y2s = toString y2
    vector = format4 "M{1},190 C{1},225 {1},196 {1},190 C{1},167 54,174 54,142 C54,120 54,74 54,3"
      (x1s, y1s, x2s, y2s)
  in
    vector

main = branch
