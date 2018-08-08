import Html exposing (Html)
import Html.Attributes exposing (..)
import ParseInt exposing (parseInt)
import CursiveSVG exposing (cursiveD)
import Keyboard
import InstructionsSVG exposing (instructions)

type alias Model = {
  fillPercent : Int,
  showInstructions : Bool
}

createModel fillPercent showInstructions =
  { fillPercent = fillPercent
  , showInstructions = showInstructions
  }

init : (Model, Cmd Msg)
init = (createModel 0 True, Cmd.none)

type Msg
  = Change String
  | KeyMsg Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Change str -> case (parseInt str) of
      Ok num -> (createModel num model.showInstructions, Cmd.none)
      Err _  -> (createModel 0 model.showInstructions, Cmd.none)
    KeyMsg code -> case code of
      38 -> (createModel (model.fillPercent + 1) False , Cmd.none)
      40 -> (createModel (Basics.max (model.fillPercent - 1) 0) False , Cmd.none)
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
