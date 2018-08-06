module Growing2 exposing (..)

import Html exposing (Html)
import Time exposing (Time)

canvasBottom : Float
canvasBottom = 350

type Msg
  = MillisecondTick Time
  | KeyMsg Int

type alias Branch = Maybe Float

type alias Model =
  { numberOfBranches : Int
  , drawingLevel : Float
  , branches : List Branch
  }

init : Model
init =
  { numberOfBranches=0, drawingLevel = canvasBottom, branches = [] }

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = case msg of
  KeyMsg Int -> -- if up, add branch, if down, remove branch
  MillisecondTick Time -> -- move drawingLevel up

view : Model -> Html Msg
view model =
