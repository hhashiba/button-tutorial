module Button exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


type alias Model =
    { num : Int }


type Msg
    = Inc
    | Inc10
    | Dec
    | Dec10
    | Twice
    | OneHalf
    | Reset


init : Model
init =
    { num = 0 }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Inc ->
            { model | num = model.num + 1 }

        Inc10 ->
            { model | num = model.num + 10 }

        Dec ->
            { model | num = model.num - 1 }

        Dec10 ->
            { model | num = model.num - 10 }

        Twice ->
            { model | num = model.num * 2 }

        OneHalf ->
            { model | num = model.num // 2 }

        Reset ->
            { model | num = 0 }


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text (String.fromInt model.num) ]
        , div [ class "col1" ]
            [ button [ onClick Inc ] [ text "+1" ]
            , button [ onClick Inc10 ] [ text "+10" ]
            ]
        , div [ class "col2" ]
            [ button [ onClick Dec ] [ text "-1" ]
            , button [ onClick Dec10 ] [ text "-10" ]
            ]
        , div [ class "col3" ]
            [ button [ onClick Twice ] [ text "×2" ]
            , button [ onClick OneHalf ] [ text "1/2" ]
            , button [ onClick Reset ] [ text "Reset" ]
            ]
        ]


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
