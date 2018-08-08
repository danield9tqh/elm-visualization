module CursiveSVG exposing (cursiveD)

import Html
import Svg exposing (..)
import Svg.Attributes exposing (..)

cursiveD : Float -> Html.Html msg
cursiveD percentageFill = svg
  [ width "267px", height "264px", viewBox "0 0 267 264", version "1.1" ]
  [ desc
    []
    [ text "Created with Sketch." ]
  , defs
    []
    []
  , g
    [ id "Page-1", stroke "none", strokeWidth "1", fill "none", fillRule "evenodd" ]
    [ Svg.path
      [ strokeDasharray ((toString (percentageFill*10))++(",10000")), d "M74.8569055,7 C76.7672461,155.609551 76.7672461,235.539238 74.8569055,246.789063 C71.9913946,263.663799 43.8471471,255.285362 34.1381555,246.789063 C24.4291639,238.292763 -21.743908,211.15625 34.1381555,211.15625 C90.0202189,211.15625 116.227252,265.246477 173.806124,246.789063 C231.384996,228.331648 306.741478,90.6382275 221.970187,51.0625 C137.198896,11.4867725 97.0844696,7 80.7226562,7 C64.3608429,7 11.5831008,48.4783104 80.7226562,51.0625 C126.815693,52.7852931 184.505797,40.2540431 253.792969,13.46875", id "D", stroke "#D0021B", strokeWidth "13" ]
      []
    ]
  ]
