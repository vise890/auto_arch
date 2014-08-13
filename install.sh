#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

chmod +x ./install/*.sh

./install/bootstrap.sh

