#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing python'
sudo pacman -S --noconfirm --needed \
    python \
    bpython flake8
