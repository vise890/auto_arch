#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> Installing elm stuff"
npm install --global \
    elm \
    elm-oracle
