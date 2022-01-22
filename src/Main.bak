module Main where

import Prelude

import Data.Foldable (sum)
import Data.List (List, range, filter)
import Effect (Effect)
import Effect.Console (log)

x :: List Int
x = range 1 10


tfunc :: List Int -> Int
tfunc list_ints =
  sum $ filter (\e -> e `mod` 2 == 0) list_ints

tfunc' :: List Int -> Int
tfunc' list_ints = 
    let 
        is_even = (\e -> e `mod` 2 == 0)
        ten_is_even = is_even 10
        x = "text"
    in
    sum
        $ filter is_even
        $ list_ints


tfunc'' :: List Int -> Int
tfunc'' list_ints = 
    sum
        $ filter is_even
        $ list_ints
    where
        is_even = (\e -> e `mod` 2 == 0)
        ten_is_even = is_even 10
        x = "text"



result :: List Int
result = filter (\e -> e `mod` 2 == 0) x

main :: Effect Unit
main = do
  log "Eat some 🍝 !!!"
