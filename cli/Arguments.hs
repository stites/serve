module Arguments (
  Args
  port
  ) where

import Options.Applicative

data Args = { port :: Int }

port :: Parser Int
port = option auto
   ( long "port"
  <> short 'p'
  <> value 8080
  <> metavar "[port]"
  <> help "specify the port - default:8080" )

