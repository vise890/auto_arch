#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "============================"
echo "==> bootstrapping system <=="
echo "============================"
./bootstrap/sudo.sh # install sudo and allow users in group 'wheel' to be sudoers
./bootstrap/optimize_pacman_mirrorlist.sh
./bootstrap/upgrade_system.sh
