#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing gnome packages"
sudo pacman -S --noconfirm --needed \
  gnome \
  gnome-tweak-tool gnome-packagekit \
  gnome-logs \
  gedit gedit-code-assistance gedit-plugins \
  networkmanager

echo "==> Enabling NetworkManager service"
systemctl enable NetworkManager
