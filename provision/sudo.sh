#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> allow all members of wheel to be sudoers"
pacman -S --noconfirm sudo
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
visudo -c # abort if /etc/sudoers became corrupted
