module Board where

import Effects exposing (Effects, map, batch, Never)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json


-- MODEL

type alias Model =
  { board : ... -- List / Array / Dict
  }

init : (Model, Effects Action)
init =
    ( Model ... -- Init List / Array / Dict
    , Effects.none
    )


-- UPDATE

type Action
  = ...


update : Action -> Model -> (Model, Effects Action)
update message model =
  ...


-- VIEW

(=>) = (,)


view : Signal.Address Action -> Model -> Html
view address model =
  ...
