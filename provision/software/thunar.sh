#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing thunar and plugins"
sudo pacman -S --noconfirm \
  thunar \
  gvfs thunar-volman \
  thunar-archive-plugin thunar-media-tags-plugin \
  tumbler ffmpegthumbnailer poppler-glib libgsf libopenraw
