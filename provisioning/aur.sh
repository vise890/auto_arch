#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

AUR_BUILDS_USER=aurbuilds
AUR_BUILDS_DIR=/tmp/aurbuilds

echo "==> creating $AUR_BUILDS_USER user for building AUR packages; logging it in"
useradd $AUR_BUILDS_USER || true

echo "==> installing base-devel package group"
pacman -S --needed --noconfirm base-devel

echo "==> fetching packer package"
mkdir -p $AUR_BUILDS_DIR
cd $AUR_BUILDS_DIR
wget "https://aur.archlinux.org/packages/pa/packer/packer.tar.gz"
tar -xvf packer.tar.gz && rm packer.tar.gz
chown -R $AUR_BUILDS_USER $AUR_BUILDS_DIR
cd packer

echo "==> making packer package (makepkg)"
pacman -S --needed --noconfirm git grep sed bash curl pacman jshon expac # installing packer dependencies
su -c "makepkg" $AUR_BUILDS_USER # build the package

echo "==> installing packer"
pacman -U packer*.tar.xz # install the package built with makepkg

echo "==> have a look at /etc/makepkg.conf for more configuration options"
