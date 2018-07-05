module Update exposing (..)

import Model exposing (Model, Msg(..))
import Enum


init : ( Model, Cmd Msg )
init =
    ( Model.init, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( (case msg of
        SetDataType dataType ->
            Model dataType (Enum.toString Model.dataTypeEnum dataType)

        NoOp ->
            model
      )
    , Cmd.none
    )
