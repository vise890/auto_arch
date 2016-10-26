#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing haveged (entropy generation)"
sudo pacman -S --noconfirm --needed \
  haveged

echo "==> Enabling NetworkManager service"
systemctl enable haveged

