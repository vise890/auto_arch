#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing gnome packages"
pacman -S --noconfirm --needed \
  gnome \
  gnome-tweak-tool gnome-packagekit \
  polari geary\
  gdm networkmanager

echo "==> Enabling gdm and networkmanager services"
systemctl enable gdm
systemctl enable NetworkManager
