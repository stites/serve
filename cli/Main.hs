module Main where

import Serve (app)
import Network.Wai.Handler.Warp (run)

import Options.Applicative
import Data.Version (showVersion)
import Paths_serve (version)

data ServeOptions = ServeOptions
  { optPort    :: Int
  , optVersion :: Bool
  }

--       -- putStrLn $ "http://localhost:$port"
--       -- run 8080 app
portArgument :: Parser Int
portArgument = option auto
   ( long "port"
  <> short 'p'
  <> value 8080
  <> metavar "[port]"
  <> help "specify the port - default:8080" )

versionArgument :: Parser Bool
versionArgument = switch
   ( long "version"
  <> short 'v'
  <> help "Output version number")

main :: IO ()
main = do
  opts <- execParser parser
  if optVersion opts
  then runCommandVersion
  else putStrLn $ show $ optPort opts
  where
    parser = info (helper <*> options)
       ( fullDesc
      <> progDesc descTxt
      <> header   helpTxt )

options :: Parser ServeOptions
options = ServeOptions
  <$> portArgument
  <*> versionArgument

runCommandVersion :: IO ()
runCommandVersion = putStrLn $ "serve v" ++ showVersion version

descTxt, helpTxt :: String
descTxt = "A simple, warp-based static content server"
helpTxt =  "testing aristnarisetnrasiet"
