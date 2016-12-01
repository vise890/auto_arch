#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# FIXME: is there a way to pass some env to the chroot instead?
source '/auto_arch/0_variables.sh'


echo "==> setting locale to $LOCALE"
LOCALE_GEN="${LOCALE} UTF-8"
sed -i "s/#${LOCALE_GEN}/${LOCALE_GEN}/" /etc/locale.gen
locale-gen
echo "LANG=\"$LOCALE\"" > /etc/locale.conf


echo "==> setting up time (localtime = $LOCALTIME)"
hwclock --systohc --utc
ln -s "/usr/share/zoneinfo/$LOCALTIME" /etc/localtime


echo "==> installing bootloader"
bootctl install

echo "
title    Arch Linux
linux    /vmlinuz-linux
initrd   /initramfs-linux.img
options  root=$ROOT_PARTITION rw
" > "/boot/loader/entries/arch.conf"

echo "
default    arch
timeout    3
" > "/boot/loader/loader.conf"


echo "==> setting up network"
# TODO: this needs to be able to do wifi
systemctl enable dhcpcd


echo "==> setting hostname to $NEW_HOSTNAME"
echo "$NEW_HOSTNAME" > /etc/hostname
echo "127.0.1.1	${NEW_HOSTNAME}.localdomain	$NEW_HOSTNAME" >> /etc/hosts


echo '==> setting root password to the value of DEFAULT_PASSWORD'
echo "root:$DEFAULT_PASSWORD" | chpasswd

# NOTE: hacking this to bits for auto_arch to work again
if [ "$ENABLE_SSH" ]; then
  echo '==> Enabling ssh'
  pacman -S --needed --noconfirm openssh
  systemctl enable sshd

  echo "==> creating default user ($DEFAULT_USER)"
  useradd -m -G wheel -s /bin/bash "$DEFAULT_USER"
  echo "$DEFAULT_USER:$DEFAULT_PASSWORD" | chpasswd

  echo "==> installing sudo"
  pacman -S --noconfirm sudo

  echo "==> allow all members of wheel to be sudoers"
  sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
  visudo -c # abort if /etc/sudoers became corrupted
fi

echo '==> checking network'
SHELL_NOT_WORKING_MSG='==> Network does not seem to work!! dropping to a shell'
ping -c 3 www.archlinux.org || (echo "$SHELL_NOT_WORKING_MSG"; bash)
