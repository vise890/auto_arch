#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './0_variables.sh'

./provision/optimize_pacman_mirrorlist.sh
./provision/upgrade-system.sh

./provision/cli_packages.sh
./provision/ntp.sh
#./provision/haskell.sh
./provision/aur.sh

#./provision/infinality.sh

./provision/gtk.sh
#./provision/gui_packages.sh

#./provision/networkmanager.sh
#./provision/gnome.sh
#./provision/gdm.sh

#./provision/lightdm.sh
#./provision/i3.sh
#./provision/thunar.sh

./provision/sudo.sh # install sudo and allow users in group 'wheel' to be sudoers

./provision/default-user-create.sh # NOTE: it will be a sudoer
