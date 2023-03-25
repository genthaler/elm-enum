module Tests exposing (..)

import Enum
import Expect
import Model
import Test


-- Check out http://package.elm-lang.org/packages/elm-community/elm-test/latest to learn more about testing in Elm!


all : Test.Test
all =
    Test.describe "A Test Suite"
        [ Test.test "Addition" <|
            \_ ->
                let
                    enum =
                        Model.dataTypeEnum
                in
                    case Enum.findEnumValue enum "Text" of
                        Err err ->
                            Expect.fail err

                        Ok dataType ->
                            Expect.equal (Enum.toString enum dataType) "Text"
        ]
