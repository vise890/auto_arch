#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing rng-tools'
sudo pacman -S --noconfirm rng-tools
systemctl enable rngd
