#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> setting up ssh access for $DEFAULT_USER"
DEFAULT_HOME="/home/$DEFAULT_USER"
mkdir -v -p "$DEFAULT_HOME"/.ssh
cp -v "${AUTO_ARCH_INSTALL_PATH}/authorized_keys" "${DEFAULT_HOME}/.ssh/authorized_keys"

chown -v -R "$DEFAULT_USER": "$DEFAULT_HOME"/.ssh
chmod -v -R 700 "$DEFAULT_HOME"/.ssh
chmod -v 600 "$DEFAULT_HOME"/.ssh/*


