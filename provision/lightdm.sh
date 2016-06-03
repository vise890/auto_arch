#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing lightdm'
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter
systemctl enable lightdm
