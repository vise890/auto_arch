#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './0_variables.sh'

echo '==> preparing the disk'
sgdisk --zap-all "$DISK"
sgdisk --clear "$DISK"

sgdisk --new=1:0:+512MM "$DISK" --typecode=1:ef00 --change-name=1:"ESP"   # 512MB Efi System Partition -> /boot
sgdisk --new=2:0:+20GB "$DISK"  --typecode=2:8300 --change-name=2:"/"     # 21GB linux fs root -> /
sgdisk --new=3:0:0 "$DISK"      --typecode=3:8300 --change-name=3:"/home" # (rest) linux fs home -> /home

mkfs.fat -F32 "${DISK}1"
mkfs.ext4 "${DISK}2"
mkfs.ext4 "${DISK}3"

echo "==> mounting partitions.. on $ROOT_MOUNTPOINT"

mount "${DISK}2" "$ROOT_MOUNTPOINT"
mkdir -p "${ROOT_MOUNTPOINT}/boot" "${ROOT_MOUNTPOINT}/home"

mount "${DISK}1" "${ROOT_MOUNTPOINT}/boot"
mount "${DISK}3" "${ROOT_MOUNTPOINT}/home"


