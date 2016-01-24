#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing ruby'
pacman -S --noconfirm --needed ruby
