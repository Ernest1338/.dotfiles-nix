{ lib, pkgs, ... }: {
    home.packages = with pkgs; [ neovim ];
    home.sessionVariables = {
        EDITOR = "nvim";
    };
}
