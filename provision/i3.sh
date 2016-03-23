#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing i3 packages'
pacman -S --noconfirm \
  i3 \
  feh

echo '==> Installing yegonesh (application launcher)'
packer -S --noconfirm yegonesh
