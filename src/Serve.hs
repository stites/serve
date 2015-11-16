{-# LANGUAGE OverloadedStrings #-}

module Serve (app) where

import Network.Wai
import Network.HTTP.Types
import Data.List (intercalate)

app :: Application
app req res = do
  putStrLn $ intercalate " " [
      "(<<)",
      show (requestMethod req),
      show (remoteHost req)
    ]
  res $ responseLBS
    status200
    [("Content-Type", "text/plain")]
    "Hello, World!"




