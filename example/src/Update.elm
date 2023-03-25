module Update exposing (..)

import Model exposing (Model, Msg(..))
import Enum


update : Msg -> Model -> Model
update msg model =
    (case msg of
        SetDataType dataType ->
            Model dataType (Enum.toString Model.dataTypeEnum dataType)

        NoOp ->
            model
    )
