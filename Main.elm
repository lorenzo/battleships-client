module Main where

import Effects exposing (Never)
import Game exposing (init, update, view)
import StartApp
import Task


app =
  StartApp.start
    { init = init "TBD: battle ship init"
    , update = update
    , view = view
    , inputs = []
    }


main =
  app.html


port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks
