#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> adding herecura-stable pacman repo"

echo '

# additional packages not found in the community repository
[herecura-stable]
Server = http://repo.herecura.be/herecura-stable/$arch' >> /etc/pacman.conf

pacman -Syy --noconfirm
pacman -Suu --noconfirm

echo "==> installing vim"
pacman -Rscnd --noconfirm vi
pacman -S --noconfirm vim-cli

