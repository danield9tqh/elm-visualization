import Html exposing (Html)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import ParseInt exposing (parseInt)
import SVGTree exposing (svgUniformTree)
import Keyboard
import Html.Events exposing (onWithOptions)
import InstructionsSVG exposing (instructions)

type alias Model = {
  numBranches : Int,
  showInstructions : Bool
}

newModel : Int -> Bool -> Model
newModel numBranches showInstructions =
  { numBranches = numBranches
  , showInstructions = showInstructions
  }

init : (Model, Cmd Msg)
init = (newModel 0 True, Cmd.none)

type Msg
  = Change String
  | KeyMsg Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Change str -> case (parseInt str) of
      Ok num -> (newModel num False, Cmd.none)
      Err _  -> (newModel 0   False, Cmd.none)
    KeyMsg code -> case code of
      38 -> (newModel (model.numBranches + 1)                False , Cmd.none)
      40 -> (newModel (Basics.max (model.numBranches - 1) 0) False , Cmd.none)
      _  -> (model, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model = Keyboard.downs KeyMsg

view : Model -> Html Msg
view model = Html.div [ Html.Attributes.style
    [ ("height", "100%")
    , ("width", "100%")
    , ("display", "flex")
    , ("flex-direction", "column")
    , ("align-items", "center")
    , ("justify-content", "center")
    ] ]
    [ Html.input [ defaultValue (toString model.numBranches), placeholder "Natural Number", onInput Change ] []
    , ( case model.showInstructions of
          True -> instructions
          False -> (svgUniformTree model.numBranches 100)
      )
    ]

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
