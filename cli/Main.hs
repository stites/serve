module Main where

import Serve (app)
import Network.Wai.Handler.Warp (run)

import Options.Applicative

import CliOptions (options, ServeOptions(..))
import CliVersion (runCommandVersion)

main :: IO ()
main = do
  opts <- execParser parser
  if optVersion opts
  then runCommandVersion
  else putStrLn "arst"
--     p <- optPort opts
--     putStrLn $ "http://localhost" ++ p
--     run p app
  where
    parser = info (helper <*> options)
       ( fullDesc
      <> progDesc descTxt
      <> header   helpTxt )

descTxt, helpTxt :: String
descTxt = "A simple, warp-based static content server"
helpTxt =  "testing aristnarisetnrasiet"
