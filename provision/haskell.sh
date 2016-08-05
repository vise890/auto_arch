#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing haskell"
sudo pacman -S --noconfirm \
  ghc cabal-install stack \
  hlint stylish-haskell hasktags ghc-mod # dev tools

echo "==> installing libs needed by 'stack setup'"
packer -S --noconfirm ncurses5-compat-libs
