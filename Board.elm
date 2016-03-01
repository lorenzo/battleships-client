module Board (view, initialBoard, Model) where

import Effects exposing (Effects, map, batch, Never)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Matrix exposing (Matrix)
import List
import Array exposing (Array)
import Maybe exposing (Maybe(..))


-- MODEL

type alias Model =
  { board : Matrix String
  }


initialBoard = Model (Matrix.repeat 10 10 "a")

view : Signal.Address a -> Model -> Html
view address model =
  table []
        (List.map (renderRow model.board) [0..9])

renderRow : Matrix String -> Int -> Html
renderRow board rowNumber =
  tr []
     (List.map (renderColumn (Matrix.getRow rowNumber board)) [0..9])

renderColumn : Maybe (Array String) -> Int -> Html
renderColumn columns number =
  let cols = columns |> Maybe.withDefault Array.empty in
  td []
     [text <| Maybe.withDefault "" <|  Array.get number cols]



