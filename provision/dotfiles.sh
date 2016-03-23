#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> giving $DEFAULT_USER some pimpin dotfiles"
cd "/home/$DEFAULT_USER"
sudo -u "$DEFAULT_USER" git clone https://github.com/vise890/dotfiles
cd ./dotfiles
sudo -u "$DEFAULT_USER" make
cd


