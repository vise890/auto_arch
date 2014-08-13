#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './variables.sh'

chmod +x ./install/*.sh

./install/bootstrap.sh

