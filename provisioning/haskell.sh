#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> adding haskell-core to pacman.conf"
# FIXME: this section should go before [extra]
# to take precedence over those packages
echo "

[haskell-core]
Server = http://xsounds.org/~haskell/core/\$arch
" >> /etc/pacman.conf

pacman-key -r 4209170B
# FIXME: should probably check the fingerprint
pacman-key --lsign-key 4209170B
pacman-key --refresh-keys

pacman -Syy --noconfirm

echo "==> installing haskell"
pacman -S --noconfirm ghc \
  cabal-install \
  happy alex \
  haskell-ghc-mod
