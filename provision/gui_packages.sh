#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing gnome packages"
pacman -S --noconfirm --needed \
  baobab gparted \
  transmission-gtk notification-daemon



