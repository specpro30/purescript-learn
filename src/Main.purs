module Main where

import Prelude

import Data.List (List, filter, range)
import Effect (Effect)
import Effect.Console (log)

x :: List Int
x = range 1 10

result = filter (\e -> mod e 2 == 0) x

evens = x

main :: Effect Unit
main = do
  log "Eat some 🍝 !!!"
