module Update exposing (..)

import Model exposing (Model, Msg(..))
import Enum


init : ( Model, Cmd Msg )
init =
    ( Model.init, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( case msg of
        SetDataType dataTypeString ->
            (case Enum.findEnumValue Model.dataTypeEnum dataTypeString of
                Ok dataType ->
                    Model dataType (.toString Model.dataTypeEnum <| dataType)

                Err err ->
                    { model | message = err }
            )

        NoOp ->
            model
    , Cmd.none
    )
