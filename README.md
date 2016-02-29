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

Use the provided skeleton using [StartApp](https://github.com/evancz/elm-architecture-tutorial), or follow the [flickr](http://elm-lang.org/examples/flickr) example and use bare http + tasks.

NB: this project does not compile when cloned.

## Getting started

```elm
git clone https://github.com/elmcph/battleships-client.git
cd battleships-client
npm install
export PATH=$PATH:./node_modules/.bin  # Or equivalent on Windows
elm-live 
```

This example uses [elm-live](https://github.com/tomekwi/elm-live) to compile and auto-reload.
You could also use [elm-server](https://github.com/maxgurewitz/elm-server)
