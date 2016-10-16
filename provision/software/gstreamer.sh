#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> installing GStreamer and plug-ins'
sudo pacman -S --noconfirm \
  gstreamer \
  gst-libav \
  gst-plugins-base gst-plugins-good \
  gst-plugins-bad gst-plugins-ugly
