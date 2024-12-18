{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Servant.WASM
-- Copyright   :  (C) 2025 David M. Johnson
-- License     :  BSD3-style (see the file LICENSE)
-- Maintainer  :  David M. Johnson <code@dmj.io>
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

instance Accept WASM where
  contentType _ = "application/wasm"

instance MimeUnrender WASM ByteString where
  mimeUnrender _ = Right . L.toStrict

instance MimeRender WASM ByteString where
  mimeRender _ = L.fromStrict
