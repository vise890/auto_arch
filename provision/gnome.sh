#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing gnome packages"
pacman -S --noconfirm --needed \
  gnome \
  gnome-tweak-tool gnome-packagekit \
  networkmanager

echo "==> Enabling NetworkManager service"
systemctl enable NetworkManager
