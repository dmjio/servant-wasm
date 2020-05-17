servant-wasm
==========================
[![Hackage](https://img.shields.io/hackage/v/servant-wasm.svg)](http://hackage.haskell.org/package/servant-wasm)
[![Haskell Programming Language](https://img.shields.io/badge/language-Haskell-green.svg)](https://haskell.org)
[![BSD3 LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/dmjio/servant-wasm/blob/master/LICENSE)
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
```

and corresponding JS to fetch WASM client-side.

```js
const importObject = {};
WebAssembly.instantiateStreaming(fetch('/wasm'), importObject).then(results => {
  // Do something with the results!
});
```
