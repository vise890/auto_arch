#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> upgrading system"
pacman -Syy --noconfirm
pacman -Suu --noconfirm
