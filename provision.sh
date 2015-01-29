#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './variables.sh'

./provisioning/upgrade-system.sh
./provisioning/packages.sh
./provisioning/vim.sh
./provisioning/aur.sh

./provisioning/create-default-user.sh

./provisioning/dotfiles.sh
./provisioning/zsh-as-default.sh
