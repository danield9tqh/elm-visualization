module InstructionsSVG exposing (instructions)

import Html
import Svg exposing (..)
import Svg.Attributes exposing (..)

instructions : Html.Html msg
instructions = svg
  [ width "300px", height "175px", viewBox "0 0 493 232", version "1.1"]
  [ desc
    []
    [ text "Created with Sketch." ]
  , defs
    []
    []
  , g
    [ id "Page-1", stroke "none", strokeWidth "1", fill "none", fillRule "evenodd" ]
    [ Svg.path
      [ d "M8,2 C4.6862915,2 2,4.6862915 2,8 L2,224 C2,227.313708 4.6862915,230 8,230 L485,230 C488.313708,230 491,227.313708 491,224 L491,8 C491,4.6862915 488.313708,2 485,2 L8,2 Z", id "Rectangle", stroke "#4A4A4A", strokeWidth "4", fillOpacity "0.764039855", fill "#677B8A" ]
      []
    , rect
      [ id "Rectangle", stroke "#4A4A4A", strokeWidth "3", fillOpacity "0.65", fill "#9B9B9B", x "318.5", y "40.5", width "123", height "51", rx "8" ]
      []
    , rect
      [ id "Rectangle", stroke "#4A4A4A", strokeWidth "3", fillOpacity "0.65", fill "#9B9B9B", x "318.5", y "135.5", width "123", height "51", rx "8" ]
      []
    , Svg.path
      [ d "M383.506715,48.5264966 L417.506969,79.1237629 C419.149081,80.6015199 419.282316,83.1306728 417.804559,84.7727841 C417.045985,85.6157259 415.965267,86.0970683 414.831254,86.0970683 L342.817171,86.0970683 C340.608032,86.0970683 338.817171,84.3062073 338.817171,82.0970683 C338.817171,80.9630552 339.298513,79.8823371 340.141455,79.1237629 L374.14171,48.5264966 C376.803768,46.1308759 380.844656,46.1308759 383.506715,48.5264966 Z", id "Triangle", stroke "#979797", fill "#4A4A4A" ]
      []
    , Svg.path
      [ d "M382.161022,179.781578 C380.211959,181.535565 377.436466,181.535565 375.487402,179.781578 L339.137948,147.070237 C338.418515,146.42281 338,145.444784 338,144.410973 C338,142.527145 339.363157,141 341.044697,141 L416.603728,141 C417.526526,141 418.39953,141.468863 418.977435,142.274843 C420.030503,143.743514 419.821439,145.890485 418.510476,147.070237 L382.161022,179.781578 Z", id "Triangle", stroke "#979797", fill "#4A4A4A" ]
      []
    , Svg.text_
      [ id "Press", fontFamily "Avenir-Book, Avenir", fontSize "100", fontWeight "normal", fill "#4A4A4A" ]
      [ tspan
        [ x "31", y "139" ]
        [ text "Press" ]
      ]
    ]
  ]

main = instructions
