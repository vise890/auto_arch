#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing and enabling sshd"
pacman -S --noconfirm --needed openssh
# TODO: disable password auth
systemctl enable sshd

