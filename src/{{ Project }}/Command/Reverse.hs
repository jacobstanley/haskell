{-# LANGUAGE NoImplicitPrelude #-}
module {{ Project }}.Command.Reverse (
    Reverse(..)
  , {{ project }}Reverse
  ) where

import qualified Data.List as List

import           {{ Project }}.Reverse (reverse)
import           {{ Project }}.Prelude

data Reverse =
  Reverse {
      reverseInput :: [String]
    , reverseSeparator :: String
    } deriving (Eq, Ord, Show)

{{ project }}Reverse :: Reverse -> ExceptT () IO ()
{{ project }}Reverse x =
  liftIO .
    putStrLn .
    List.intercalate (reverseSeparator x) $
    reverse (reverseInput x)
