#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing zsh"
sudo pacman -S --noconfirm --needed zsh

echo "==> changing ${DEFAULT_USER}'s shell to zsh"
sudo chsh -s /bin/zsh "$DEFAULT_USER"
