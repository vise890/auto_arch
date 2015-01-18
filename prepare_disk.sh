#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './variables.sh'

echo '==> preparing the disk'
sgdisk --zap-all "$DISK"
sgdisk --new=1:0:0 "$DISK"
mkfs.ext4 -q "$ROOT_PARTITION"

echo "==> mounting $ROOT_PARTITION on $MAIN_MOUNTPOINT"
mount "$ROOT_PARTITION" "$MAIN_MOUNTPOINT"
