servant-wasm
==========================
![Hackage](https://img.shields.io/hackage/v/servant-wasm.svg)
![Haskell Programming Language](https://img.shields.io/badge/language-Haskell-green.svg)
[![BSD3 LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/dmjio/servant-wasm/blob/master/servant-wasm/LICENSE)
[![Build Status](https://travis-ci.org/dmjio/servant-wasm.svg?branch=master)](https://travis-ci.org/dmjio/servant-wasm)

Content-Type support for delivering WASM with [servant](https://github.com/haskell-servant/servant)

### Usage

```haskell
{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE TypeOperators     #-}
{-# LANGUAGE TypeApplications  #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Monad.IO.Class     (liftIO)
import qualified Data.ByteString            as B
import           Data.Proxy
import           Network.Wai.Handler.Warp
import           Servant.Server
import           Servant.Server.StaticFiles
import           Servant.WASM

type API = "wasm" :> Get '[WASM] ByteString

main :: IO ()
main = do
  putStrLn "Running on 3000..."
  run 3000 (serve (Proxy @ API) wasmHandler)

wasmHandler :: Handler ByteString
wasmHandler = liftIO (B.readFile "hello.wasm")
```
