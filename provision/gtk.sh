#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing settings tools'
sudo pacman -S --noconfirm --needed \
  lxappearance

echo '==> Installing themes'
sudo pacman -S --noconfirm --needed \
  deepin-gtk-theme
