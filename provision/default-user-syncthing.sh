#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '=> installing syncthing'
pacman -S --noconfirm --needed \
    syncthing syncthing-inotify syncthing-gtk

echo "=> enabling syncthing for ${DEFAULT_USER}"
sudo -u "$DEFAULT_USER" systemctl enable --user syncthing

