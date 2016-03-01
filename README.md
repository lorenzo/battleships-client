# Elm Copenhagen Meetup March 2016
HTTP Requests / JSON Decoding task

## Battleships

![Battleships](https://upload.wikimedia.org/wikipedia/commons/e/e4/Battleships_Paper_Game.svg)

## Batleships Game Server

(IP will be provided at the meetup)

## Exercise

Build a battleship game client that will allow a player to:

  - Create a new game
  - Join existing game
  - See the board grid (10 x 10)
  - Fire shots at a grid location and see the result of the shot
  - See a list of on-going games
  - See details of a given game

You can start with simple Http Task, see the example in SimpleTask.elm.

Then you can move on to use [StartApp](https://github.com/evancz/elm-architecture-tutorial), which there are some skeleton files in this repo (Main.elm, Game.elm and Board.elm - but they do not compile)

## Getting started

```elm
git clone https://github.com/elmcph/battleships-client.git
cd battleships-client
npm install
export PATH=$PATH:./node_modules/.bin  # Or equivalent on Windows
# Edit SimpleTask.elm and enter the Battleships game server host/port
elm-live  SimpleTask.elm
```
Open [http://localhost:8000]

## Local reload servers:

This example uses [elm-live](https://github.com/tomekwi/elm-live) to compile and auto-reload.
You could also use [elm-server](https://github.com/maxgurewitz/elm-server)
