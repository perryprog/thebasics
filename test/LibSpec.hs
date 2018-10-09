module LibSpec where

import Test.Hspec
import Test.Hspec.QuickCheck (modifyMaxSize)
import Test.QuickCheck

import Data.List

import Lib

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "readFileToLines" $
    it "Gets the contents of a file" $ do
      fileContents <- readFileToLines "words.txt"
      head fileContents `shouldBe` "2" -- First item in said file
      last fileContents `shouldBe` "ZZZ" -- And the last item
  describe "removeDisallowed" $
    modifyMaxSize (const 1000) $
      it "Has no results with disallowed chars" $ property $
        \x xs -> all (\y -> (y \\ x) == y) $ removeDisallowed (x :: String) (xs :: [String])
