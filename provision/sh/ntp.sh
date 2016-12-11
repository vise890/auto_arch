#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Sync time with NTP"
timedatectl set-ntp true
