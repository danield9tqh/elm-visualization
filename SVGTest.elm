import Html
import Svg exposing (..)
import Svg.Attributes exposing (..)
import String.Format exposing (format2, format4, format6)
import SVGBranch exposing (createBranch)

branch : Html.Html msg
branch =
    svg [width "500px", height "500px", viewBox "0 0 500 500", version "1.1"]
      [ Svg.g [stroke "none", strokeWidth "1", fill "none", fillRule "evenodd", strokeLinecap "round"] tree ]

path = uniformBranch 20 400
path2 = uniformBranch 70 300
path3 = uniformBranch 120 200

tree = branches 4 20 400
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

main = branch
