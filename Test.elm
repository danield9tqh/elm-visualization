import Html exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)

main = svg
  [ width "288px", height "82px", viewBox "0 0 288 82", version "1.1"]
  [ desc
    []
    [ Html.text "Created with Sketch." ]
  , defs
    []
    []
  , g
    [ id "Page-1", stroke "none", strokeWidth "1", fill "none", fillRule "evenodd" ]
    [ Svg.path
      [ d "M25.4382084,78.6495597 C-40.6540166,11.9185296 57.1789856,2.91197997 86.597773,2.91197997 C116.01656,2.91197997 107.666591,72.6665754 143.397191,78.6495597 C179.127791,84.632544 292.992094,42.0327676 285.106467,2.91197997", id "Path-3", stroke "#979797", strokeWidth "4" ]
      []
    ]
  ]
