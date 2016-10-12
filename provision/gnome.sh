#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing gnome packages"
sudo pacman -S --noconfirm --needed \
  gnome \
  gnome-tweak-tool \
  gnome-logs \
  gedit gedit-code-assistance gedit-plugins \
  networkmanager \
  polari gnome-maps \
  gnome-calendar gnome-clocks \
  gnome-music gnome-videos \
  gnome-boxes gnome-software

echo "==> Enabling NetworkManager service"
systemctl enable NetworkManager
