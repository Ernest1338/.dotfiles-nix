#!/usr/bin/env bash

set -euo pipefail
pushd ~/.dotfiles/ &>/dev/null
git diff
echo "NixOS Rebuilding..."
git pull
git add .
hname=$(hostname)
sudo nixos-rebuild switch --cores $(nproc) --flake .#$hname || exit 1
gen=$(nixos-rebuild list-generations | grep current)
read -p "Commit? (y) " -n 1 -r
echo
if [[ $REPLY = "" || $REPLY =~ ^[Yy]$ ]]; then
    git commit -am "$gen"
fi
read -p "Push? (n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git push
fi
popd &>/dev/null
