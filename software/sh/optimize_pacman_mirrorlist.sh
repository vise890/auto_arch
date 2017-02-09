#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> optimizing pacman mirrorlist"
sudo pacman -S --noconfirm --needed reflector
reflector -l 50 -p http --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy --noconfirm
