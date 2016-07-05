{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE ScopedTypeVariables        #-}
{-# LANGUAGE TypeOperators              #-}

module Main where

import           Lib
import           Network.GitHub.Types
import           Network.Wai.Handler.Warp
import           Servant

type API
  -- GET /stars
  = "stars" :> Get '[JSON] [Star]

api :: Proxy API
api = Proxy

server :: Server API
server
  -- GET /stars
  = getStars False

main :: IO ()
main = do
  let port = 3000
  putStrLn $ "GET http://localhost:" ++ (show port) ++ "/stars"
  run 3000 (serve api server)

{-
  result <- getStars False
  -- result <- fmap head <$> getStars False
  case result of
    Left  err   -> print err
    Right stars -> print stars
-}
