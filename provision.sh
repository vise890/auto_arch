#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './variables.sh'

./provisioning/upgrade-system.sh
./provisioning/packages.sh
#./provisioning/haskell.sh
./provisioning/vim.sh
./provisioning/aur.sh
#./provisioning/gnome.sh
#./provisioning/infinality.sh

./provisioning/create-default-user.sh
./provisioning/ssh-for-default-user.sh # ssh access for default user, needs authorized keys to be present

./provisioning/dotfiles.sh
./provisioning/zsh-as-default.sh
