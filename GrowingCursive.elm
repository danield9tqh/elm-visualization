import Html exposing (Html)
import Html.Attributes exposing (..)
import CursiveSVG exposing (cursiveD)
import Keyboard
import InstructionsSVG exposing (instructions)

type alias Model = {
  fillPercent : Int,
  showInstructions : Bool
}

newModel : Int -> Bool -> Model
newModel fillPercent showInstructions =
  { fillPercent = fillPercent
  , showInstructions = showInstructions
  }

init : (Model, Cmd Msg)
init = (newModel 0 True, Cmd.none)

type Msg
  = KeyMsg Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    KeyMsg code -> case code of
      38 -> (newModel (model.fillPercent + 1)                False , Cmd.none)
      40 -> (newModel (Basics.max (model.fillPercent - 1) 0) False , Cmd.none)
      _  -> (model, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model = Keyboard.downs KeyMsg

view : Model -> Html Msg
view model = Html.div [Html.Attributes.style
  [ ("height", "100%")
  , ("width", "100%")
  , ("display", "flex")
  , ("align-items", "center")
  , ("justify-content", "center")
  ] ]
    [( case model.showInstructions of
          True -> instructions
          False -> (cursiveD (toFloat model.fillPercent))
      )]

main : Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
