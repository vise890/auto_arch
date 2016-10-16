#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing haskell"
sudo pacman -S --needed --noconfirm \
  ghc cabal-install stack \
  haskell-text \
  hlint stylish-haskell \
  hasktags ghc-mod \
  haskell-hspec haskell-hspec-core haskell-hspec-discover haskell-hspec-expectations \
  haskell-attoparsec \
  haskell-aeson \
  haskell-optparse-applicative
