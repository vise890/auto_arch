#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> optimizing pacman mirrorlist"
pacman -Syy
pacman -S --noconfirm reflector
reflector -l 50 -p http --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy

echo "==> installing base system"
pacstrap "$MAIN_MOUNTPOINT" base base-devel

echo '==> generating an fstab'
genfstab -U -p "$MAIN_MOUNTPOINT" >> "$MAIN_MOUNTPOINT/etc/fstab"

echo '==> moving over files to chroot environment'
cp -r "$AUTO_ARCH_INSTALL_PATH" "$MAIN_MOUNTPOINT"

echo '==> chrooting, see you on the other side.'
arch-chroot "$MAIN_MOUNTPOINT" "$AUTO_ARCH_INSTALL_PATH/install/chroot.sh"

echo "==> aaand, we're back. Unmounting and powering off."
umount -R "$MAIN_MOUNTPOINT"
reboot

