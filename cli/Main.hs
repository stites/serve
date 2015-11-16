module Main where

import Serve (app)
import Network.Wai.Handler.Warp (run)

import Options.Applicative

import CliOptions (options, ServeOptions(..))
import CliVersion (runCommandVersion)

serve :: ServeOptions -> IO ()
serve opts = do
  putStrLn $ "http://localhost:" ++ show port
  putStrLn $ pathArg opts
  run port app
    where port = optPort opts

main :: IO ()
main = do
  opts <- execParser parser
  if optVersion opts
  then runCommandVersion
  else serve opts
  where
    parser = info (helper <*> options)
       ( fullDesc <> header descTxt )

descTxt :: String
descTxt = "A simple, warp-based static content server"

