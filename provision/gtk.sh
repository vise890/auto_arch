#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing settings tools'
pacman -S --noconfirm --needed \
  lxappearance

echo '==> Installing themes'
pacman -S --noconfirm --needed \
  deepin-gtk-theme
