#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

AUR_BUILDS_USER=aurbuilds
AUR_BUILDS_DIR=/tmp/aurbuilds

echo "==> creating $AUR_BUILDS_USER user for building AUR packages; logging it in"
useradd $AUR_BUILDS_USER || true

echo "==> installing base-devel package group"
pacman -S --needed --noconfirm base-devel

echo "==> fetching packer snapshot"
mkdir -p $AUR_BUILDS_DIR
cd $AUR_BUILDS_DIR
wget "https://aur.archlinux.org/cgit/aur.git/snapshot/packer.tar.gz"

echo "==> extracting packer"
chown -R $AUR_BUILDS_USER $AUR_BUILDS_DIR
tar -xvf packer.tar.gz && rm packer.tar.gz
cd packer

echo "==> making packer package (makepkg)"
su -c "makepkg --syncdeps" $AUR_BUILDS_USER # build the package and deps (-s)

echo "==> installing packer"
pacman -U --noconfirm packer*.tar.xz # install the package built with makepkg

packer -S --noconfirm pacaur

echo "==> have a look at /etc/makepkg.conf for more configuration options"
