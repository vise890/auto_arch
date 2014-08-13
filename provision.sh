#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# FIXME: when invoked by packer, all relative paths won't work
#        (it just calls this provision.sh script)
#        the current solution (hardcoding everywhere) isn't too good
AUTO_ARCH_PATH=/auto_arch
cd $AUTO_ARCH_PATH

source './variables.sh'

chmod +x ./provisioning/*.sh

./provisioning/upgrade-system.sh
./provisioning/packages.sh
./provisioning/vim.sh

# FIXME: too heavy/not needed for now, re-add later
# ./provisioning/haskell.sh

./provisioning/virtualbox-guest-utils.sh
./provisioning/vagrant.sh

./provisioning/create-default-user.sh

