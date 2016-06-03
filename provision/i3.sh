#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing i3 packages'
sudo pacman -S --needed --noconfirm \
  i3 \
  feh xautolock dmenu rxvt-unicode

echo '==> Installing yegonesh (application launcher)'
packer -S --noconfirm yegonesh
