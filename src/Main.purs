module Main
  ( Person
  , birthday
  , main
  )
  where

import Prelude

import Data.Foldable (sum)
import Data.List (List, range, filter)
import Effect (Effect)
import Effect.Console (log)

type Person = 
  { name :: String
  , age :: Int
  }

birthday :: Person -> Person
birthday { name, age } = 
  { name: name, age: age + 1 } 

f :: Int -> Int -> Int
f 0 _ = -1 
f _ y = 25 + y
f 100 y = -50 + y
f 0 50 = -500
f x y = x + y

main :: Effect Unit
main =
    let 
        joe = { name: "Joe", age: 39}
        joes_birthday = birthday joe
    in do
    log "hello world 3.2" 