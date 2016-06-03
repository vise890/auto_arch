#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing ruby'
sudo pacman -S --noconfirm --needed ruby pry
