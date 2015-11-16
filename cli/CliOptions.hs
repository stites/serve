module CliOptions
  ( ServeOptions(..)
  , options
  ) where

import Options.Applicative

data ServeOptions = ServeOptions
  { optPort    :: Int
  , optVersion :: Bool
  }

options :: Parser ServeOptions
options = ServeOptions
  <$> portArgument
  <*> versionArgument

-----------------------------------

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


