{-# LANGUAGE NoImplicitPrelude #-}

import qualified Bench.{{ Project }}.Reverse

import           Gauge.Main (defaultMain)

import           {{ Project }}.Prelude


main :: IO ()
main =
  defaultMain [
      Bench.{{ Project }}.Reverse.benchmark
    ]
