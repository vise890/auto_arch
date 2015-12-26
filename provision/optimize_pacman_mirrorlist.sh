#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> optimizing pacman mirrorlist"
pacman -S --noconfirm reflector
reflector -l 50 -p http --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy
