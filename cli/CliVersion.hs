module CliVersion (runCommandVersion) where

import Data.Version (showVersion)
import Paths_serve (version)

runCommandVersion :: IO ()
runCommandVersion = putStrLn $ "serve v" ++ showVersion version

