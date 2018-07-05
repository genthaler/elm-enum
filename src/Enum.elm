module Enum exposing (Enum, makeEnum, findEnumValue, decodeEnumValue, onEnumInput, enumSelect)

{-|
@docs Enum, makeEnum, findEnumValue, decodeEnumValue, onEnumInput, enumSelect

-}

import Json.Decode as Decode
import Html
import Html.Attributes
import Html.Events


{-| Union type representing an `Enum`. Note that this an [opaque type](https://medium.com/@ckoster22/advanced-types-in-elm-opaque-types-ec5ec3b84ed2);
use #makeEnum to construct `Enum`s.
-}
type Enum a
    = Enum (List a) (a -> String)


{-| `Enum` constructor.
```
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
```
-}
makeEnum : List a -> (a -> String) -> Enum a
makeEnum values enumToString =
    Enum values enumToString


{-| Return the string representation of the `Enum`.
```
type DataType
    = Text

enum = makeEnum [Text] Basics.toString

(Enum.toString enum Text) == "Text"
```
-}
toString : Enum a -> a -> String
toString (Enum _ enumToString) value =
    enumToString value


{-|
 If possible, return the union type tag from the String representation.
```
type DataType
    = Text

enum = makeEnum [Text] Basics.toString

(Enum.findEnumValue enum "Text") == Ok Text
(Enum.findEnumValue enum "Foo") == Err "Foo"
```
-}
findEnumValue : Enum a -> String -> Result String a
findEnumValue (Enum values enumToString) value =
    values
        |> List.filter ((==) value << enumToString)
        |> List.head
        |> Result.fromMaybe value


{-| Converts the output of [`findEnumValue`](#findEnumValue) to a Json.Decode.Decoder
-}
decodeEnumValue : Enum a -> String -> Decode.Decoder a
decodeEnumValue enum stringValue =
    case findEnumValue enum stringValue of
        Ok value ->
            Decode.succeed value

        Err err ->
            Decode.fail err


{-| Converts

-}
onEnumInput : Enum a -> (a -> msg) -> Html.Attribute msg
onEnumInput enum tagger =
    let
        decodeTargetValue =
            Html.Events.targetValue
                |> Decode.andThen (decodeEnumValue enum)
                |> Decode.map tagger
    in
        Html.Events.on "input" decodeTargetValue


{-| Constructs an `<option>`` element

-}
enumOption : Enum a -> a -> a -> Html.Html msg
enumOption enum selectedValue value =
    Html.option
        [ Html.Attributes.selected (selectedValue == value) ]
        [ Html.text <| toString enum value ]


{-| Takes an `Enum`, a Msg and a currently selected value,
and constructs a `<select>` element.

```
view model =
    div [] [ Enum.enumSelect Model.dataTypeEnum SetDataType model.dataType, text model.message ]
```

Take a look at the example project for a simple use-case.
-}
enumSelect : Enum a -> (String -> msg) -> a -> Html.Html msg
enumSelect enum msg selectedValue =
    let
        (Enum values _) =
            enum
    in
        Html.select
            [ Html.Events.onInput msg ]
            (List.map (enumOption enum selectedValue) values)
