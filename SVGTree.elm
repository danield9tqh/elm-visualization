module SVGTree exposing (svgUniformTree)

import Html
import Svg exposing (..)
import Svg.Attributes exposing (..)
import SVGBranch exposing (createBranch, svgLine)

type TreeDirection = TreeLeft | TreeRight

svgUniformTree : Int -> Float -> Html.Html msg
svgUniformTree numBranches percentFiled =
    svg [width "100%", height "90%", version "1.1" ]
      [ {-- fillRect, --}
       Svg.g [stroke "none", strokeWidth "1", fill "none", fillRule "evenodd", strokeLinecap "round"]
       ((uniformTree numBranches (percentFiled) TreeRight 350 350 ))
      ]

uniformTree : Int -> Float -> TreeDirection -> Int -> Int -> List (Svg msg)
uniformTree numBranches percentFiled direction x y = case direction of
  TreeLeft  -> branchesRightToLeft numBranches x y percentFiled
  TreeRight -> branchesLeftToRight numBranches x y percentFiled

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
