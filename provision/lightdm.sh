#!/bin/bash
set -euo pipefail
ifs=$'\n\t'

echo '==> Installing lightdm'
pacman -S --noconfirm lightdm
systemctl enable lightdm
