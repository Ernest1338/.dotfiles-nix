#!/usr/bin/env bash

set -e
pushd ~/.dotfiles/
echo "NixOS Updating..."
git pull
sudo nix flake update && ./rebuild.sh
popd
