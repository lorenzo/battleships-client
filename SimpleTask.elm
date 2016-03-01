module SimpleTask (..) where

-- Adapted from http://www.elm-tutorial.org Effects Task02 example

import Html
import Time
import Http
import Json.Decode as Json exposing ((:=))
import Task


view : List String -> Html.Html
view messages =
  Html.ul [] (List.map viewMessage messages)


viewMessage : String -> Html.Html
viewMessage message =
  Html.li [] [ Html.text message ]


clockSignal : Signal Time.Time
clockSignal =
  Time.every (2 * Time.second)


mb : Signal.Mailbox (List String)
mb =
  Signal.mailbox [] 


httpTask : Task.Task Http.Error (List String)
httpTask =
  Http.get decodeGames "http://178.62.254.16:9999/games"

decodeGames : Json.Decoder (List String)
decodeGames = 
  "games" := (Json.list Json.string)


sendToMb : List String -> Task.Task x ()
sendToMb games =
  Signal.send mb.address games


runTask : Task.Task Http.Error ()
runTask =
  Task.andThen httpTask sendToMb


taskSignal : Signal (Task.Task Http.Error ())
taskSignal =
  Signal.map (always runTask) clockSignal


main : Signal.Signal Html.Html
main =
  Signal.map view mb.signal


port runner : Signal (Task.Task Http.Error ())
port runner =
  taskSignal
