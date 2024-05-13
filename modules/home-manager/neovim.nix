{ lib, pkgs, ... }: {
    home.packages = with pkgs; [
        neovim
        lua-language-server
    ];
}
