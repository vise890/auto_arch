#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing sudo"
pacman -S --noconfirm sudo

echo "==> allow all members of wheel to be sudoers"
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
visudo -c # abort if /etc/sudoers became corrupted
