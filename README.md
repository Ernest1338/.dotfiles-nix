# Instalation

Install system using Gnome ISO
Create a user "dvdnix" and set password
Warsaw, No GUI, allow unfree

```sh
nix-shell -p git
git clone https://github.com/Ernest1338/.dotfiles ~/.dotfiles
cd ~/.dotfiles
sudo nixos-generate-config --show-hardware-config > ./hosts/$(hostname)/hardware-configuration.nix
./rebuild.sh
reboot
```

## Notes
- If neovim has broken treesitter parsers, see :checkhealth nvim-treesitter and install them
  using `:TSInstall lang`
- Instead of `nix-shell -p neofetch` use `nix shell nixpkgs#neofetch`
