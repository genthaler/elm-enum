module Model exposing (Model, init, Msg(..), DataType, dataTypeEnum)

import Enum exposing (..)


type alias Model =
    { dataType : DataType
    , message : String
    }


init : Model
init =
    { dataType = Text
    , message = Enum.toString dataTypeEnum Text
    }


type DataType
    = Text
    | Date
    | Email
    | Address
    | Postcode
    | State
    | Gender


dataTypeEnum : Enum DataType
dataTypeEnum =
    Enum.makeEnum
        [ Text
        , Date
        , Email
        , Address
        , Postcode
        , State
        , Gender
        ]
        Debug.toString


type Msg
    = NoOp
    | SetDataType DataType
