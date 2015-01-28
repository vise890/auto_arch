#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DEFAULT_HOME="/home/$DEFAULT_USER"

echo "==> creating default user ($DEFAULT_USER)"
useradd -m -G wheel -s /bin/bash "$DEFAULT_USER"
echo "$DEFAULT_USER:$DEFAULT_PASSWORD" | chpasswd

# FIXME: move ssh stuff to renegade_arch
echo "==> setting up default user for ssh access"
mkdir -v -p "$DEFAULT_HOME"/.ssh
cp -v "$AUTO_ARCH_INSTALL_PATH"/authorized_keys "$DEFAULT_HOME"/.ssh/authorized_keys

chown -v -R "$DEFAULT_USER": "$DEFAULT_HOME"/.ssh
chmod -v -R 700 "$DEFAULT_HOME"/.ssh
chmod -v 600 "$DEFAULT_HOME"/.ssh/*

