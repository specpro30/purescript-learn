module Main
  ( Person
  , birthday
  , main
  )
  where

import Prelude

import Data.Foldable (sum)
import Data.List (List(Nil), (:), range, filter)
import Effect (Effect)
import Effect.Console (log)

-- AND types - Product type (age x name)
type Person = 
  { name :: String
  , age :: Int
  }

birthday :: Person -> Person
birthday { name, age } = 
  { name: name, age: age + 1 } 

-- ADT - Algebraic Data Types

-- Product Type ADT
type PersonDetails =
    { age :: Int
    , name :: String
    }

-- Sum Type ADT
data Person'
    = LocalPerson String Int
    | ForeignPerson String Int Int

newtype YearsOfResidence = ResidedInCountry Int

data Person''
    = LocalPerson'' PersonDetails
    | ForeignPerson'' PersonDetails YearsOfResidence
    | IllegalPerson PersonDetails

s :: Person'
s = LocalPerson "Joe" 39

t :: Person'
t = ForeignPerson "Sam" 40 10

u :: Person''
u = ForeignPerson'' { name: "Anny", age: 26 } (ResidedInCountry 10)


-- | Better version of the "interfacy" type of example for birthday function
-- | which doesn't care what kind of record gets passed, as long as it has an 
-- | age field
birthday' :: forall a. { age :: Int | a} -> { age :: Int | a}
birthday' whatever =
    whatever { age = whatever.age + 1}

-- Some pattern matching
{- f :: Int -> Int -> Int
f 0 _ = -1 
f _ y = 25 + y
f 100 y = -50 + y
f 0 50 = -500
f x@5 y = x + y

f x y | x > 5 = x + y -}

-- Creating our own sum function

sum' :: List Int -> Int 
sum' l =
    inner_sum' l 0
    where
        inner_sum' :: List Int -> Int -> Int
        inner_sum' Nil accum = accum
        inner_sum' (e : Nil) accum = e + accum
        inner_sum' (e : es) accum = inner_sum' es (accum + e)

--sum' (e : es) = e + sum' es

--input = (1 : 2 : 3)

-- This is head recursive as it starts at the top and find all the elements down the list, then from bottom back to top
-- sum' (1 : 2 : 3) = 1 + sum' (2 : 3)
-- sum' (2 : 3) = 2 + sum' (3)
-- sum' (3) = 3

-- catch all
f x y = x + y

main :: Effect Unit
main =
    let 
        joe = { name: "Joe", age: 39}
        joes_birthday = birthday joe
    in do
    log "hello world 3.2" 