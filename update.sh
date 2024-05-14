#!/usr/bin/env bash

set -e
pushd ~/.dotfiles/
git pull
echo "NixOS Updating..."
sudo nix flake update && ./rebuild.sh
popd
