#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing zsh"
pacman -S --noconfirm --needed zsh

echo "==> changing ${DEFAULT_USER}'s shell to zsh"
chsh -s /bin/zsh "$DEFAULT_USER"
