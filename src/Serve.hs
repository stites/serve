module Serve (app) where

import Network.Wai
import Network.HTTP.Types
import qualified Data.Text.IO as Tio

app :: Application
app _ respond = do
  Tio.putStrLn "IO - handled"
  respond $ responseLBS
    status200
    [("Content-Type", "text/plain")]
    "Hello, World!"




