#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing base-devel package group and needed pkgs"
sudo pacman -S --needed --noconfirm base-devel wget

(cd /tmp

  echo "==> fetching packer snapshot"
  wget "https://aur.archlinux.org/cgit/aur.git/snapshot/packer.tar.gz"

  echo "==> extracting packer"
  tar -xvf packer.tar.gz && rm packer.tar.gz

  chown -R nobody packer
  (cd packer
    echo "==> making packer package (makepkg)"
    # FIXME: there must be a better way to install deps as root
    pacman -S --needed --noconfirm expac git jshon
    # FIXME: ... and build as non sudoer
    sudo -u nobody makepkg

    echo "==> installing packer"
    pacman -U --noconfirm packer*.tar.xz

    echo "==> have a look at /etc/makepkg.conf for more configuration options"
  )
)



