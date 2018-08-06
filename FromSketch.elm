import Html exposing (..)
import Html.Attributes exposing (..)

main =    div
  [ class "artboard", style [("-webkit-text-size-adjust", "none"), ("width", "100%"), ("min-width", "517px"), ("height", "100vh"), ("min-height", "329px"), ("position", "relative"), ("overflow", "hidden"), ("margin", "0"), ("background", "rgba(255,255,255,1.0)")] ]
  [ div
    [ class "stacked-group", style [("-webkit-text-size-adjust", "none"), ("display", "flex"), ("justify-content", "flex-start"), ("flex-direction", "row"), ("align-items", "center"), ("background", "rgba(255,255,255,0.0)"), ("top", "0"), ("height", "100%"), ("width", "100%"), ("position", "relative"), ("margin", "0"), ("left", "0")] ]
    [ input
      [ name "trapit", value "", style [("display", "none")] ]
      []
    , div
      [ class "rectangle", style [("-webkit-text-size-adjust", "none"), ("background", "rgba(215,215,215,1.0)"), ("position", "relative"), ("height", "329px"), ("margin", "0"), ("width", "146px"), ("border-style", "solid"), ("border-width", "1px"), ("border-color", "rgba(150,150,150,1.0)")] ]
      [ input
        [ name "trapit", value "", style [("display", "none")] ]
        []
      ]
    , div
      [ class "stacked-group1", style [("-webkit-text-size-adjust", "none"), ("display", "flex"), ("justify-content", "flex-start"), ("flex-direction", "column"), ("align-items", "center"), ("background", "rgba(255,255,255,0.0)"), ("position", "relative"), ("height", "100%"), ("margin", "0 0 0 10px"), ("flex", "100.00")] ]
      [ input
        [ name "trapit", value "", style [("display", "none")] ]
        []
      , div
        [ class "rectangle2", style [("-webkit-text-size-adjust", "none"), ("background", "rgba(215,215,215,1.0)"), ("position", "relative"), ("margin", "0"), ("flex", "74"), ("width", "100%"), ("border-style", "solid"), ("border-width", "1px"), ("border-color", "rgba(150,150,150,1.0)")] ]
        [ input
          [ name "trapit", value "", style [("display", "none")] ]
          []
        ]
      , div
        [ class "rectangle3", style [("-webkit-text-size-adjust", "none"), ("background", "rgba(215,215,215,1.0)"), ("position", "relative"), ("margin", "10px 0 0 0"), ("flex", "74"), ("width", "100%"), ("border-style", "solid"), ("border-width", "1px"), ("border-color", "rgba(150,150,150,1.0)")] ]
        [ input
          [ name "trapit", value "", style [("display", "none")] ]
          []
        ]
      , div
        [ class "rectangle4", style [("-webkit-text-size-adjust", "none"), ("background", "rgba(215,215,215,1.0)"), ("position", "relative"), ("margin", "10px 0 0 0"), ("flex", "74"), ("width", "100%"), ("border-style", "solid"), ("border-width", "1px"), ("border-color", "rgba(150,150,150,1.0)")] ]
        [ input
          [ name "trapit", value "", style [("display", "none")] ]
          []
        ]
      , div
        [ class "rectangle1", style [("-webkit-text-size-adjust", "none"), ("background", "rgba(215,215,215,1.0)"), ("position", "relative"), ("margin", "10px 0 0 0"), ("flex", "77"), ("width", "100%"), ("border-style", "solid"), ("border-width", "1px"), ("border-color", "rgba(150,150,150,1.0)")] ]
        [ input
          [ name "trapit", value "", style [("display", "none")] ]
          []
        ]
      ]
    ]
  ]
