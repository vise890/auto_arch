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
  gnome-music totem \
  gnome-boxes gnome-software
