module Lib
    ( getStars
    ) where

import           Data.Bool          (bool)
import           Data.String
import           Network.GitHub
import           Servant.Client (ServantError)
import           System.Environment

getStars :: Bool -> IO (Either ServantError [Star])
getStars shouldRecurse =
  fmap fromString <$> lookupEnv "GITHUB_TOKEN" >>= runGitHub go
    where go = bool recurseOff recurseOn shouldRecurse >> userStars
