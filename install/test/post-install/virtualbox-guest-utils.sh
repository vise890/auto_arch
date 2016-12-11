#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing virtualbox guest additions"
pacman -S --noconfirm virtualbox-guest-utils
depmod
modprobe -a vboxguest vboxsf vboxvideo
echo -e "vboxguest\nvboxsf\nvboxvideo" > /etc/modules-load.d/virtualbox.conf
systemctl enable vboxservice
