module View exposing (..)

import Html exposing (..)
import Model exposing (Model, Msg(..), DataType)
import Enum


view : Model -> Html Msg
view model =
    div [] [ Enum.enumSelect Model.dataTypeEnum SetDataType model.dataType, text model.message ]
