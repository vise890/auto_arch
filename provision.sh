#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# FIXME: when packer launces provision.sh, it is from some random location
source '/auto_arch/variables.sh'
cd $AUTO_ARCH_INSTALL_PATH

./provisioning/upgrade-system.sh
./provisioning/packages.sh
./provisioning/vim.sh

# FIXME: too heavy/not needed for now, re-add later
# ./provisioning/haskell.sh

./provisioning/create-default-user.sh
