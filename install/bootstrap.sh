#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> optimizing pacman mirrorlist"
pacman -Syy
pacman -S --noconfirm reflector
reflector -l 50 -p http --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy

echo "==> installing base system"
pacstrap "$ROOT_MOUNTPOINT" base base-devel

echo '==> generating an fstab'
genfstab -U -p "$ROOT_MOUNTPOINT" >> "$ROOT_MOUNTPOINT/etc/fstab"

echo '==> moving over files to chroot environment'
cp -r "$AUTO_ARCH_INSTALL_PATH" "$ROOT_MOUNTPOINT"

echo '==> chrooting, see you on the other side.'
arch-chroot "$ROOT_MOUNTPOINT" "$AUTO_ARCH_INSTALL_PATH/install/chroot.sh"

echo "==> aaand, we're back. Unmounting and powering off."
umount -R "$ROOT_MOUNTPOINT"

reboot
