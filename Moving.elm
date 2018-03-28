import Html exposing (Html)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import ParseInt exposing (parseInt)
import SVGTree exposing (canvas)
import Keyboard
import Html.Events exposing (onWithOptions)

type alias Model = Int

init : (Model, Cmd Msg)
init = (0, Cmd.none)

type Msg
  = Change String
  | KeyMsg Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Change str -> case (parseInt str) of
      Ok num -> (num, Cmd.none)
      Err _  -> (0, Cmd.none)
    KeyMsg code -> case code of
      38 -> (model + 1, Cmd.none)
      40 -> (Basics.max (model - 1) 0, Cmd.none)
      _  -> (model, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model = Keyboard.downs KeyMsg

view : Model -> Html Msg
view model = Html.div [Html.Attributes.style [("height", "100%"), ("width", "100%")] ]
    [ Html.input [ defaultValue (toString model), placeholder "Natural Number", onInput Change ] []
    , (canvas model)
    ]

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
