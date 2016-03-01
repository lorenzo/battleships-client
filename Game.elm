module Game (init, update, view, mb) where

import Effects exposing (Effects, map, batch, Never)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Signal
import Http
import Http.Extra as HttpExtra exposing (..)
import Json.Decode as Json exposing ((:=))
import Json.Decode.Extra exposing ((|:))
import Json.Encode as E
import Task

import Maybe exposing (Maybe(..))
import Debug

import Board exposing (initialBoard)


-- MODEL

type alias PlayerName = String
type alias GameID = String
type alias PlayerID = String

type alias Model =
  { name : PlayerName
  , game : Maybe GameID
  , player: Maybe PlayerID
  , board : Board.Model
  }

mb : Signal.Mailbox Action
mb =
  Signal.mailbox NoOp

init : (Model, Effects Action)
init =
    ( initialModel
    , Task.succeed (Create "Jose") |> Effects.task
    )

initialModel =
    { name = "Jose"
    , game = Nothing
    , player = Nothing
    , board = initialBoard
    }

-- UPDATE

type Action
  = Create PlayerName
  | Join PlayerName GameID
  | StartGame PlayerName GameID PlayerID
  | Play GameID PlayerID
  | NoOp
  -- | BoardMsg GameID PlayerID Board.Action


update : Action -> Model -> (Model, Effects Action)
update action model =
    case Debug.log "action" action of
        Create playerName -> (model, createGame playerName)
        StartGame playerName gameId playerId ->
          ( {model | game = Just gameId, player = Just playerId}
          , Effects.none
          )
        _ -> (model, Effects.none)

createGame : PlayerName -> Effects Action
createGame name =
  HttpExtra.post "http://178.62.254.16:9999/create"
    |> withBody (encodePlayer name)
    |> withHeader "Content-Type" "application/json"
    |> withHeader "Accept" "application/json"
    |> send (jsonReader newGameDecoder) stringReader
    |> kickOff

extractValue error response =
  response.data


encodePlayer : PlayerName -> Http.Body
encodePlayer name =
  E.object [("name", E.string name)]
  |> E.encode 0
  |> Http.string

newGameDecoder : Json.Decoder Action
newGameDecoder =
  Json.succeed StartGame
  |: ("name" := Json.string)
  |: ("game" := Json.string)
  |: ("player" := Json.string)


-----------------------------------

httpTask : Task.Task Http.Error Action
httpTask =
  Http.get decodeGames "http://178.62.254.16:9999/games"

decodeGames : Json.Decoder Action
decodeGames =
    Json.succeed NoOp

sendToMb : Action -> Task.Task x ()
sendToMb action =
  Signal.send mb.address action


runTask : Task.Task Http.Error ()
runTask =
  Task.andThen httpTask sendToMb

kickOff =
    Task.map .data >> Task.toMaybe >> Task.map (Maybe.withDefault NoOp) >> Effects.task
------------------------------------------

view : Signal.Address Action -> Model -> Html
view address model =
  Board.view address model.board 
