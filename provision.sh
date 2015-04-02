#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './variables.sh'

./provision/upgrade-system.sh
./provision/packages.sh
#./provision/haskell.sh
./provision/vim.sh
./provision/aur.sh
#./provision/gnome.sh
#./provision/infinality.sh

./provision/create-default-user.sh
./provision/ssh-for-default-user.sh # ssh access for default user, needs authorized keys to be present

./provision/dotfiles.sh
./provision/zsh-as-default.sh
