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

import Data.String.Common (toUpper)

to_upper :: String -> String
to_upper input = toUpper input

append_foo :: String -> String
append_foo input = input <> " foo"

{- do_both :: String -> String
do_both input = to_upper $ append_foo input -}

do_both :: String -> String
do_both = to_upper <<< append_foo 

do_both' :: String -> String
do_both' = append_foo >>> to_upper -- in Haskell it is a "." h = g after f. but what is the reversible? 
 
append_foo_many :: Int -> String -> String
append_foo_many 0 input = input
append_foo_many count input = append_foo_many (count -1) (append_foo input)

append_f :: Int -> String -> String
append_f count input
    | count <= 0 = input
    | otherwise = append_f (count -1) (append_foo input)

main :: Effect Unit
main =
    let 
        my_string = append_f 100000 "joes string"
    in
    log my_string