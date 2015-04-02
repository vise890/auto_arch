#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd "/home/$DEFAULT_USER"

mkdir .fonts
cd .fonts

wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline%20Bold%20Italic.ttf
wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline%20Bold.ttf
wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline%20Italic.ttf
wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline.ttf

sudo fc-cache -f -v

cd
