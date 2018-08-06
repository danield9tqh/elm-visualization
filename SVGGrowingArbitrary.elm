module SVGGrowingArbitrary exposing (canvas)

import Html
import Svg exposing (..)
import Svg.Attributes exposing (..)

canvas : Float -> Html.Html msg
canvas percentageFill =
      svg
        [ width "298px", height "357px", viewBox "0 0 298 357", version "1.1" ]
        [ desc
          []
          [ text "Created with Sketch." ]
        , defs
          []
          []
        , g
          [ id "Page-1", stroke "none", strokeWidth "1", fill "none", fillRule "evenodd" ]
          [ Svg.path
            [ strokeDasharray ((toString (percentageFill*10))++(",10000")), d "M0.17578125,41.9609375 C180.757383,-12.5243346 273.382383,-12.5243346 278.050781,41.9609375 C280.034231,65.1099441 320.098643,208.173155 278.050781,227.335938 C252.605123,238.932475 148.419288,123.566636 126.476562,141.726562 C56.6643041,199.50359 22.8079167,290.636413 24.34375,324.027344 C26.2212501,364.846536 115.178281,366.225442 291.214844,328.164063", id "Path", stroke "#979797" ]
            []
          ]
        ]

main = canvas 4
