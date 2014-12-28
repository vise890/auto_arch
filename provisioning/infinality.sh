#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> adding infinality-bundle to pacman.conf"
echo '
[infinality-bundle]
Server = http://bohoomil.com/repo/$arch
' >> /etc/pacman.conf

echo "==> adding infinality-bundle key"
pacman-key -r 962DDE58
# FIXME: should probably check the fingerprint
pacman-key --lsign-key 962DDE58

echo "==> installing infinality-bundle"
pacman -Syy --noconfirm
# FIXME: does not automatically replace freetype2, fontconfig and cairo if they are installed
pacman -S --force --noconfirm infinality-bundle

echo "==> installing some useful fonts"
pacman -S --noconfirm ttf-liberation ttf-ubuntu-font-family
