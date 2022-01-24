module Main
  ( main
  )
  where

import Prelude

import Data.Foldable (sum)
import Data.List (List(Nil), (:), range, filter)
import Data.Traversable (traverseDefault)
import Effect (Effect)
import Effect.Console (log)


main :: Effect Unit
main =
    log "hello world!"