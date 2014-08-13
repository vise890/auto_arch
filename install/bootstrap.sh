#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source '../variables.sh'

echo "==> optimizing pacman mirrorlist"
pacman -Syy
pacman -S --noconfirm reflector
reflector -l 50 -p http --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy

echo '==> preparing the disk'
sgdisk --zap-all $DISK
sgdisk --new=1:0:0 $DISK
mkfs.ext4 -q $ROOT_PARTITION

echo "==> mounting $ROOT_PARTITION on $MAIN_MOUNTPOINT"
mount $ROOT_PARTITION $MAIN_MOUNTPOINT

echo "==> installing base system"
pacstrap $MAIN_MOUNTPOINT base base-devel

echo '==> generating an fstab'
genfstab -U -p $MAIN_MOUNTPOINT >> $MAIN_MOUNTPOINT/etc/fstab

echo '==> moving over files to chroot environment'
# FIXME: permission should already be set
chmod u+x ./chroot.sh
# FIXME: this is now just one big folder
cp ./variables.sh $MAIN_MOUNTPOINT
cp ./chroot.sh $MAIN_MOUNTPOINT
cp ./authorized_keys $MAIN_MOUNTPOINT

echo '==> chrooting, see you on the other side.'
arch-chroot $MAIN_MOUNTPOINT /chroot.sh

echo "==> aaand, we're back. Unmounting and powering off."
umount -R $MAIN_MOUNTPOINT
reboot

