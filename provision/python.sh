#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing python'
sudo pacman -S --noconfirm --needed \
    python \
    python-pip \
    bpython flake8 \
    ipython \
    jupyter jupyter-notebook python-ipykernel \
    python-numpy python-scipy \
    python-pandas python-sympy
    python-matplotlib \
    python-nose

