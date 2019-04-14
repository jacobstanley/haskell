{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}
module Test.{{ Project }}.Reverse (
    tests
  ) where

import           Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range

import           {{ Project }}.Prelude
import           {{ Project }}.Reverse (reverse)

prop_reverse :: Property
prop_reverse =
  property $ do
    xs <- forAll .
      Gen.list (Range.linear 0 10000) $
      Gen.int (Range.linear 0 100)

    reverse (reverse xs) === xs

tests :: IO Bool
tests =
  checkParallel $$(discover)
