#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# FIXME: when invoked by packer, all relative paths won't work
#        (it just calls this provision.sh script)
#        the current solution (hardcoding everywhere) isn't too good
AUTO_ARCH_PATH=/auto_arch

source '$AUTO_ARCH_PATH/variables.sh'

chmod +x ./provisioning/*.sh

$AUTO_ARCH_PATH/provisioning/upgrade-system.sh
$AUTO_ARCH_PATH/provisioning/packages.sh
$AUTO_ARCH_PATH/provisioning/vim.sh

# FIXME: too heavy/not needed for now, re-add later
# $AUTO_ARCH_PATH/provisioning/haskell.sh

$AUTO_ARCH_PATH/provisioning/virtualbox-guest-utils.sh
$AUTO_ARCH_PATH/provisioning/vagrant.sh

$AUTO_ARCH_PATH/provisioning/create-default-user.sh

