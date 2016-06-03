#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> upgrading system"
sudo pacman -Syy --noconfirm
sudo pacman -Suu --noconfirm
