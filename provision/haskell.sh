#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing haskell"
sudo pacman -S --needed --noconfirm \
  ghc cabal-install stack \
  hlint stylish-haskell hasktags ghc-mod hspec # dev tools
