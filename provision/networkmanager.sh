#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing gnome packages"
sudo pacman -S --noconfirm --needed \
  networkmanager

echo "==> Enabling NetworkManager service"
systemctl enable NetworkManager

