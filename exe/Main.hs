{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE TypeOperators     #-}
{-# LANGUAGE TypeApplications  #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Monad.IO.Class     (liftIO)
import qualified Data.ByteString            as B
import           Data.ByteString            (ByteString)
import           Data.Proxy                 (Proxy (Proxy))
import           Network.Wai.Handler.Warp   (run)
import           Servant.Server             (serve, Handler)
import           Servant.API                ((:>), Get)
import           Servant.WASM               (WASM)

type API = "wasm" :> Get '[WASM] ByteString

main :: IO ()
main = do
  putStrLn "Running on 3000..."
  run 3000 (serve (Proxy @ API) wasmHandler)

wasmHandler :: Handler ByteString
wasmHandler = liftIO (B.readFile "hello.wasm")
