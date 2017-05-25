#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing networkmanager packages"
sudo pacman -S --noconfirm --needed \
  networkmanager \
  network-manager-applet \
  networkmanager-openvpn networkmanager-pptp


echo "==> Enabling NetworkManager service"
systemctl enable NetworkManager

