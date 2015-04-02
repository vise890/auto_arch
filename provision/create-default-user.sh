#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> creating default user ($DEFAULT_USER)"
useradd -m -G wheel -s /bin/bash "$DEFAULT_USER"
echo "$DEFAULT_USER:$DEFAULT_PASSWORD" | chpasswd

