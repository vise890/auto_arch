#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './variables.sh'

echo '==> preparing the disk'
# TODO: add partition labels
sgdisk --zap-all "$DISK"
sgdisk --new=1:0:+512MM "$DISK" # efi /boot
sgdisk --new=2:0:20GB "$DISK" # root /
sgdisk --new=3:0:0 "$DISK" # home /home

mkfs.fat -F32 "${DISK}1"
mkfs.btrfs -f "${DISK}2"
mkfs.btrfs -f "${DISK}3"

echo "==> mounting partitions.. on $MAIN_MOUNTPOINT"

mount "${DISK}2" "$MAIN_MOUNTPOINT"
mkdir -p "${MAIN_MOUNTPOINT}/boot" "${MAIN_MOUNTPOINT}/home"

mount "${DISK}1" "${MAIN_MOUNTPOINT}/boot"
mount "${DISK}3" "${MAIN_MOUNTPOINT}/home"


