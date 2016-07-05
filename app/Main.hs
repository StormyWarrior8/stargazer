module Main where

import Lib

main :: IO ()
main = do
  result <- getStars False
  -- result <- fmap head <$> getStars False
  case result of
    Left  err   -> print err
    Right stars -> print stars
