module Model exposing (Model, init, Msg(..), DataType, dataTypeEnum)

import Enum exposing (..)


type alias Model =
    { dataType : DataType
    , message : String
    }


init : Model
init =
    { dataType = Text
    , message = ""
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
        Basics.toString


type Msg
    = NoOp
    | SetDataType String
