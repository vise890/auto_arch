#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing ranger and deps"
sudo pacman -S --noconfirm --needed \
    ranger \
    python-chardet sudo libcaca highlight atool w3m lynx elinks poppler transmission-cli mediainfo
