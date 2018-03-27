import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, millisecond)
import Element exposing (toHtml)
import Collage exposing (collage, oval, filled, moveX)
import Color exposing (rgb)

circle = filled (rgb 116 20 123) (oval 100 100)

circleHtmlAtTime sec = toHtml (collage 1000 1000 [(moveX sec circle)])

type alias Model = Int

init : (Model, Cmd Msg)
init = (0, Cmd.none)

type Msg = Tick Time

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick _ -> (model + 1, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model = Time.every millisecond Tick

view : Model -> Html Msg
view model = circleHtmlAtTime (toFloat (model % 500))

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
