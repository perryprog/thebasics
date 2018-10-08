module Lib
  ( readFileToLines
  , removeDisallowed
  ) where

readFileToLines :: FilePath -> IO [String]
readFileToLines = fmap lines . readFile

removeDisallowed :: (Foldable f1, Foldable f2, Eq a) => f2 a -> [f1 a] -> [f1 a]
removeDisallowed disallowed = filter (not . any (`elem` disallowed))
