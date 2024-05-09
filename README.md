# Instalation

```sh
nix-shell -p git
git clone https://github.com/Ernest1338/nixos-v2 ~/.dotfiles
cd ~/.dotfiles
sudo nixos-generate-config --show-hardware-config > ./hosts/nixos/hardware-configuration.nix
./rebuild.sh
reboot
```

## Notes
- If neovim has broken treesitter parsers, see :checkhealth nvim-treesitter and install them
  using `:TSInstall lang`
