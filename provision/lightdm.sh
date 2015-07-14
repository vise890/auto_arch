#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing lightdm'
pacman -S --noconfirm lightdm
systemctl enable lightdm
