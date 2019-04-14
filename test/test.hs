{-# LANGUAGE NoImplicitPrelude #-}

import           Control.Monad (when)

import           {{ Project }}.Prelude

import           System.Exit (exitFailure)

import qualified Test.{{ Project }}.Reverse


main :: IO ()
main = do
  ok <- and <$> sequence [
      Test.{{ Project }}.Reverse.tests
    ]
  when (not ok) $
    exitFailure
