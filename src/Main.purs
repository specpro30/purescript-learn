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
import Prim.RowList (Nil)

data Toppings
    = Banana
    | Salami
    | Pineapple
    | Pepperoni

data Base
    = Normal
    | GlutenFree

data Sauce
    = Tomato
    | Creamy

data Pasta
    = Penne
    | Spaghetti

data Seafood
    = Salmon
    | Tuna
    | Abalone
    | Uni
    

data Food
    = Pizza Base (List Toppings)
    | Pasta Sauce Pasta
    | Seafood Seafood

joes_order :: Food
joes_order = Pizza Normal (Banana : Nil)

pauls_order :: Food
pauls_order = Pasta Creamy Spaghetti

rianas_order :: Food
rianas_order = Pizza GlutenFree (Pepperoni : Nil) 

place_order :: Food -> String
place_order food = 
    case food of
        Pizza base toppings -> "Pizza"
        Pasta sauce pasta -> "Pasta"
        Seafood fish -> "Fish"

place_order' :: Food -> String
place_order' (Pizza Normal toppings) = "Pizza - Normal"
place_order' (Pizza GlutenFree toppings) = "Pizza - GlutenFree"
place_order' (Pasta sauce pasta) = "Pasta"
place_order' (Seafood seafood) = "Seafood"


instance showFood :: Show Food where
    show :: Food -> String
    show (Pizza base toppings) = "Pizza - " <> show base
    show (Pasta sauce pasta) = "Pasta"
    show (Seafood seafood) = "Seafood"

instance showBase :: Show Base where
    show :: Base -> String
    show Normal = "normal"
    show GlutenFree = "glutenfree"

instance eqFood :: Eq Food where
    eq :: Food -> Food -> Boolean
    eq (Pizza _ _) (Pizza _ _) = true
    eq _ _ = false

main :: Effect Unit
main =
    let 
        same_order = pauls_order == rianas_order
    in do
    log $ show rianas_order
    log $ show same_order
    --log $ "Riana's order: " <> place_order' rianas_order 