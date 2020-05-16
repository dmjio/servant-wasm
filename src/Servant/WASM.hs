{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Servant.WASM
-- Copyright   :  (C) 2020 David M. Johnson
-- License     :  BSD3-style (see the file LICENSE)
-- Maintainer  :  David M. Johnson <djohnson.m@gmail.com>
-- Stability   :  experimental
-- Portability :  non-portable
----------------------------------------------------------------------------
module Servant.WASM
  ( WASM
  ) where

import qualified Data.ByteString.Lazy       as L
import           Data.ByteString            (ByteString)
import           Servant.API

-- | 'WASM' Content Type
data WASM

data RawJSON
  deriving Accept via JSON

instance Accept WASM where
  contentType _ = "application/wasm"

instance MimeUnrender WASM ByteString where
  mimeUnrender _ = Right . L.toStrict

instance MimeRender WASM ByteString where
  mimeRender _ = L.fromStrict
