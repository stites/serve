module Main where

import Serve (app)
import Network.Wai.Handler.Warp (run)

main :: IO ()
main = do
  putStrLn $ "http://localhost:$port"
  run 8080 app

