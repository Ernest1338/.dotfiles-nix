{ lib, pkgs, ... }: {
    home.packages = with pkgs; [ neovim ];
}