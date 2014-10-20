#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

AUR_BUILDS_USER=aurbuilds
AUR_BUILDS_DIR=/tmp/aurbuilds

echo "==> installing base-devel package group"
pacman -S --needed --noconfirm base-devel

echo "==> creating $AUR_BUILDS_USER user for building AUR packages and logging in"
useradd $AUR_BUILDS_USER || true

echo "==> fetching packer package"
mkdir -p $AUR_BUILDS_DIR
cd $AUR_BUILDS_DIR
wget https://aur.archlinux.org/packages/pa/packer/packer.tar.gz
tar -xvf packer.tar.gz && rm packer.tar.gz

chown -R $AUR_BUILDS_USER $AUR_BUILDS_DIR
cd packer

echo "==> maing packer package (makepkg)"
su -c "makepkg -s" $AUR_BUILDS_USER

echo "==> installing packer"
sudo pacman -U --noconfirm packer*.tar.xz

echo "==> have a look at /etc/makepkg.conf for more configuration options"