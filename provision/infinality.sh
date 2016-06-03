#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> adding infinality-bundle to pacman.conf"
echo '
[infinality-bundle]
Server = http://bohoomil.com/repo/$arch

[infinality-bundle-multilib]
Server = http://bohoomil.com/repo/multilib/$arch

[infinality-bundle-fonts]
Server = http://bohoomil.com/repo/fonts
' >> /etc/pacman.conf

echo "==> adding infinality-bundle key"
sudo pacman-key -r 962DDE58
# FIXME: should probably check the fingerprint
sudo pacman-key --lsign-key 962DDE58

echo "==> installing infinality-bundle"
sudo pacman -Syy --noconfirm
# FIXME: does not automatically replace freetype2, fontconfig and cairo if they are installed
sudo pacman -S --force --noconfirm infinality-bundle

echo "==> installing some useful fonts"
sudo pacman -S --noconfirm ibfonts-meta-base ibfonts-meta-extended ttf-ubuntu-font-family-ib
