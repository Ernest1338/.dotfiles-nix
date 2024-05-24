# Instalation

Install system using Gnome ISO \
Create a user "dvdnix", set password, no auto login \
Warsaw, No GUI, allow unfree

```sh
nmtui # IF WIRELESS
nix-shell -p git
git clone https://github.com/Ernest1338/.dotfiles-nix ~/.dotfiles
cd ~/.dotfiles
sudo nixos-generate-config --show-hardware-config > ./hosts/$(hostname)/hardware-configuration.nix
sudo nixos-rebuild switch --cores $(nproc) --flake .#CONFIGURATION_NAME
reboot
```

Setup swapfile https://nixos.wiki/wiki/Swap

## Notes
- If neovim has broken treesitter parsers, see :checkhealth nvim-treesitter and install them
  using `:TSInstall lang`
- Instead of `nix-shell -p neofetch` use `nix shell nixpkgs#neofetch`
- Browser YT fullscreen exit bug (loses fullscreen in hyprland window) https://reddit.com/r/hyprland/comments/1cy5zxw/browse_exits_full_screen/
- After unlock with hyprland current window doesn't regain focus
