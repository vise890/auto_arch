#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing i3 packages'
pacman -S --noconfirm \
  i3 \
  feh

echo '==> Installing yeganesh (application launcher) [hold music]'
# NOTE: yeganesh is a dmenu wrapper that accounts for frecency
# TODO: find a lighter substitute: yeganesh pulls in ghc and the whole circus
packer -S --noconfirm yeganesh
