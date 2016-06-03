#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing and enabling GDM'
sudo pacman -S --noconfirm --needed gdm
systemctl enable gdm

