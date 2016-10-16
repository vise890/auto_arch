#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing python'
sudo pacman -S --noconfirm --needed \
    python \
    \
    python-pip python-virtualenv \
    \
    python-isort python-pylint python-pycodestyle autopep8 \
    python-jedi \
    \
    bpython ipython \
    jupyter jupyter-notebook python-ipykernel \
    \
    python-numpy python-scipy \
    python-pandas python-sympy \
    python-matplotlib \
    python-nose \
    \
    python-requests python-jinja python-peewee python-flask
