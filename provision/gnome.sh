#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing gnome packages"
pacman -S --noconfirm --needed \
  gnome \
  gnome-tweak-tool gnome-packagekit \
  polari geary baobab gparted \
  transmission-gtk notification-daemon \
  networkmanager

echo "==> Enabling NetworkManager service"
systemctl enable NetworkManager
