module SVGTree exposing (canvas)

import Html
import Svg exposing (..)
import Svg.Attributes exposing (..)
import String.Format exposing (format2, format4, format6)
import SVGBranch exposing (createBranch)

canvas : Int -> Html.Html msg
canvas numBranches =
    svg [width "100%", height "90%", version "1.1" ]
      [ {-- fillRect, --}
       Svg.g [stroke "none", strokeWidth "1", fill "none", fillRule "evenodd", strokeLinecap "round"] (branches numBranches 150 350)
      ]

fillRect = rect [width "100%", height "90%", fill "red"] []

branches n x y = case n of
  0 -> []
  _ -> [uniformBranch x y] ++ branches (n-1) (x+50) (y-60)

uniformBranch x y = let
    branchHorizontalSpread = 50
    branchVerticalSpread = 100
    lowerBranchLength = 10
    upperBranchLength = 50
    branchCurvature = 15
  in
    createBranch x y branchHorizontalSpread branchVerticalSpread lowerBranchLength upperBranchLength branchCurvature "5" "#BD10E0"

main = canvas 4
