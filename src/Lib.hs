module Lib
    ( getStars
    ) where

import           Control.Monad.Except   (throwError)
import           Control.Monad.IO.Class (liftIO)
import           Data.Bool              (bool)
import           Data.String            (fromString)
import           Network.GitHub         (Star, recurseOff, recurseOn, runGitHub,
                                         userStars)
import           Servant.Server         (Handler, err500)
import           System.Environment     (lookupEnv)

getStars :: Bool -> Handler [Star]
getStars shouldRecurse = do
  token  <- liftIO (fmap fromString <$> (lookupEnv "GITHUB_TOKEN"))
  let go = bool recurseOff recurseOn shouldRecurse >> userStars
  result <- liftIO (runGitHub go token)
  case result of
    Left  err   -> throwError err500
    Right stars -> return stars
