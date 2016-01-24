#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing haskell"
pacman -S --noconfirm \
  ghc stack \
  hlint stylish-haskell hasktags ghc-mod # dev tools
