#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo pacman -S --noconfirm --needed \
  rng-tools

echo "==> Enabling RNGD service (add hardware random number generation to kernel entropy pool)"
systemctl enable rngd

