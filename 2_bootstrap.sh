#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './0_variables.sh'

echo "==> installing base system"
pacstrap "$ROOT_MOUNTPOINT" base

echo '==> generating an fstab'
genfstab -U -p "$ROOT_MOUNTPOINT" >> "$ROOT_MOUNTPOINT/etc/fstab"

echo '==> moving over files to chroot environment'
cp -r "../auto_arch" "$ROOT_MOUNTPOINT" ||
	cp -r "../*auto_arch" "$ROOT_MOUNTPOINT/auto_arch"


echo '==> chrooting, see you on the other side.'
arch-chroot "$ROOT_MOUNTPOINT" "/auto_arch/3_install_in_chroot.sh"

# TODO: don't do this here, split it out
echo "==> aaand, we're back. Unmounting and powering off."
umount -R "$ROOT_MOUNTPOINT"

reboot
