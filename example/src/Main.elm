module Main exposing (..)

import Browser
import View exposing (view)
import Update exposing (update)
import Model exposing (Model, Msg, init)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
