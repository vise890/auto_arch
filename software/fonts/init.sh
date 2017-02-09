#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo -v

# shamelessly stolen from
# https://gist.github.com/cryzed/e002e7057435f02cc7894b9e748c5671

echo "==> symlinking profiles"
sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d || true
sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d || true
sudo ln -s /etc/fonts/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d || true

echo "==> installing all teh fonts"
pacaur -S --noconfirm --needed --no-edit fonts-meta-base fonts-meta-extended-lt

echo "==> symlinking font aliases"
sudo ln -s /etc/fonts/conf.avail/30-infinality-aliases.conf /etc/fonts/conf.d || true

echo "==> adding custom ubuntu fonts profile"
sudo cp ./90-ubuntu.conf /etc/fonts/conf.d/

echo "==> stick this into /etc/profile.d/jre.sh:"
echo "# https://wiki.archlinux.org/index.php/java#Better_font_rendering"
echo "export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'"
