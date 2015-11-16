module Serve.Responses where

import Network.Wai
import Control.Monad.Trans.Resource (ResourceT)
import qualified Data.Text as T

staticFile :: T.Text -> T.Text -> ResourceT IO Response
staticFile subDir name =
