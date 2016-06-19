#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing python'
sudo pacman -S --noconfirm --needed \
    python \
    python-pip \
    bpython flake8 \
