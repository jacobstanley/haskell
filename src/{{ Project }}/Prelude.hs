{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoImplicitPrelude #-}
module {{ Project }}.Prelude (
    module X
  , hoistEither
  , hoistMaybe
  , joinEither
  , syncIO
  ) where

import           Control.Applicative as X hiding (empty)
import qualified Control.Error.Util as Error
import           Control.Exception as X (SomeException)
import           Control.Monad as X
import           Control.Monad.IO.Class as X
import           Control.Monad.Morph as X (hoist)
import           Control.Monad.Trans.Bifunctor as X
import           Control.Monad.Trans.Except as X (ExceptT(..), runExceptT)

import           Data.Bifunctor as X
import           Data.ByteString as X (ByteString)
import           Data.Foldable as X (traverse_, for_)
import           Data.Int as X (Int8, Int16, Int32, Int64)
import           Data.Map as X (Map)
import           Data.Maybe as X
import           Data.Semigroup as X
import           Data.Set as X (Set)
import           Data.Text as X (Text)
import           Data.Traversable as X (traverse, for)
import           Data.Void as X (Void)
import           Data.Word as X (Word8, Word16, Word32, Word64)

import           Prelude as X


hoistEither :: Monad m => Either x a -> ExceptT x m a
hoistEither =
  ExceptT . pure

hoistMaybe :: Monad m => x -> Maybe a -> ExceptT x m a
hoistMaybe err = \case
  Nothing ->
    hoistEither $ Left err
  Just x ->
    pure x

joinEither :: Either (Either a b) (Either a b) -> Either a b
joinEither = \case
  Left x ->
    x
  Right x ->
    x

syncIO :: MonadIO m => IO a -> ExceptT SomeException m a
syncIO =
  hoist liftIO . Error.syncIO
