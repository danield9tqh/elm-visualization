import Html exposing (Html)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, millisecond)
import Element exposing (toHtml)
import Collage exposing (collage, oval, filled, moveX)
import Color exposing (rgb)
import ParseInt exposing (parseInt)
import SVGBranch exposing (createBranch)
import SVGTree exposing (canvas)
import Keyboard
import Debug
import Html.Events exposing (onWithOptions)
import Json.Decode exposing (..)

circle = filled (rgb 116 20 123) (oval 100 100)

circleHtmlAtTime sec = toHtml (collage 1000 1000 [(moveX sec circle)])

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
