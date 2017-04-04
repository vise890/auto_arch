#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing bluetooth packages"
sudo pacman -S --noconfirm --needed \
  bluez bluez-utils


echo "==> Enabling bluetooth service"
sudo systemctl enable bluetooth.service

