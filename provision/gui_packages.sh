#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing gnome packages"
sudo pacman -S --noconfirm --needed \
  baobab gparted \
  transmission-gtk notification-daemon \
  midori chromium firefox \
  gimp \
  keepassx2 \
  libreoffice-fresh \
  vlc mplayer mpv pavucontrol \
  redshift \
  lxappearance \
  xchat

