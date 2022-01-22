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
birthday person = 
  person { age = person.age + 1 } 

main :: Effect Unit
main =
    let 
        joe = { name: "Joe", age: 39}
        joes_birthday = birthday joe
    in do
    log "hello world 2" 