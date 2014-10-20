#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './variables.sh'

./provisioning/upgrade-system.sh
./provisioning/packages.sh
./provisioning/vim.sh
./provisioning/aur.sh

# FIXME: too heavy/not needed for now, re-add later
# ./provisioning/haskell.sh

./provisioning/create-default-user.sh
