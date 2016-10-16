#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing all teh languages"
sudo pacman -S --noconfirm --needed \
    ghc stack \
    clojure \
    racket-minimal racket-docs \
    \
    python bpython \
    ruby \
    nodejs npm \
    go \
    rust cargo \
    lua \
    guile \
    ocaml \
    scala sbt \
    \
    julia julia-docs \
    crystal shards \
    nim nimble \
    elixir \
    purescript pulp \
    ponyc
