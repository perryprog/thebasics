module Main where

import Lib
import Data.List (maximumBy)
import Data.Function (on)

main :: IO ()
main = do
  contents <- readFileToLines "words.txt"
  let disallowed = "gkmqvwxz"
  let possibilities = removeDisallowed disallowed contents
  print $ maximumBy (compare `on` length) possibilities
