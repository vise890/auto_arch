#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

pacman -S --noconfirm cinnamon numix-themes elementary-icon-theme
