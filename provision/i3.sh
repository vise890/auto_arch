#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing i3 packages'
sudo pacman -S --needed --noconfirm \
  i3 \
  feh xautolock \
  dmenu rofi \
  uzbl rxvt-unicode
