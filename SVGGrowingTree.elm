module SVGGrowingTree exposing (canvas)

import Html
import Svg exposing (..)
import Svg.Attributes exposing (..)
import SVGBranch exposing (createBranch, svgLine)

canvas : Float -> Html.Html msg
canvas percentFiled =
    svg [width "100%", height "90%", version "1.1" ]
      [ {-- fillRect, --}
       Svg.g [stroke "none", strokeWidth "1", fill "none", fillRule "evenodd", strokeLinecap "round"]
       ((branchesLeftToRight 4 550 350 (percentFiled)))
      ]

branchesLeftToRight n x y percentFilled = case n of
  0 -> []
  _ -> [uniformBranchLeftToRight x y percentFilled] ++ branchesLeftToRight (n-1) (x+50) (y-60) percentFilled

branchesRightToLeft n x y percentFilled = case n of
  0 -> []
  _ -> [uniformBranchRightToLeft x y percentFilled] ++ branchesRightToLeft (n-1) (x-50) (y-60) percentFilled

uniformBranchRightToLeft x y percentFilled = let
    branchHorizontalSpread = -50
    branchVerticalSpread = 100
    lowerBranchLength = 10
    upperBranchLength = 50
    branchCurvature = 15
  in
    createBranch x y branchHorizontalSpread branchVerticalSpread lowerBranchLength upperBranchLength branchCurvature "5" "#BD10E0" percentFilled

uniformBranchLeftToRight x y percentFilled = let
    branchHorizontalSpread = 50
    branchVerticalSpread = 100
    lowerBranchLength = 10
    upperBranchLength = 50
    branchCurvature = 15
  in
    createBranch x y branchHorizontalSpread branchVerticalSpread lowerBranchLength upperBranchLength branchCurvature "5" "#BD10E0" percentFilled

main = canvas 4
