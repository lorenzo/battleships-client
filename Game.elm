module Game where

import Effects exposing (Effects, map, batch, Never)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json

import Board


-- MODEL

type alias PlayerName = String
type alias GameID = String
type alias PlayerID = String

type alias Model =
  { name : PlayerName
  , game : GameID
  , player: PlayerID
  , board : Board.Model
  }


init : (Model, Effects Action)
init =
    ( Model "" "" "" Board.init 
    , Effects.none
    )


-- UPDATE

type Action
  = Create PlayerName
  | Join PlayerName GameID
  | StartGame PlayerName GameID PlayerID
  | Play GameID PlayerID
  | BoardMsg GameID PlayerID Board.Action


update : Action -> Model -> (Model, Effects Action)
update message model =
  ...


-- VIEW

(=>) = (,)


view : Signal.Address Action -> Model -> Html
view address model =
  ...
