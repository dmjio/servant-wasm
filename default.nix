{ pkgs ? import <nixpkgs> {}
}:
pkgs.haskell.packages.ghc883.callCabal2nix "servant-wasm" ./. {}
