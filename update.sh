#!/usr/bin/env bash

set -e
pushd ~/.dotfiles/
echo "NixOS Updating..."
sudo nix flake update && ./rebuild.sh
popd
