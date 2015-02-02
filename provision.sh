#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './variables.sh'

./provisioning/upgrade-system.sh
./provisioning/packages.sh
./provisioning/vim.sh
./provisioning/aur.sh

./provisioning/create-default-user.sh
./provisioning/ssh.sh # ssh access for default user, needs authorized keys to be present

./provisioning/dotfiles.sh
./provisioning/zsh-as-default.sh
