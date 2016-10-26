#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing atom"
sudo pacman -S --noconfirm --needed \
  atom apm

