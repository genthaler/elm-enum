module Main exposing (..)

import Html
import View exposing (view)
import Update exposing (init, update)
import Model exposing (Model, Msg)


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
