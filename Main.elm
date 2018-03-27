import Html
import Element exposing (toHtml)
import Collage exposing (collage, oval, filled)
import Color exposing (black, rgb)

circle = filled (rgb 116 20 123) (oval 100 100)

main = toHtml (collage 100 100 [circle])
