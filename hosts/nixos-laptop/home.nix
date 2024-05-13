{ config, pkgs, inputs, ... }:

{
    home.username = "dvdnix";
    home.homeDirectory = "/home/dvdnix";

    imports = [
        ../../modules/home-manager/bash.nix
        ../../modules/home-manager/git.nix
        ../../modules/home-manager/tmux.nix
        ../../modules/home-manager/alacritty.nix
        ../../modules/home-manager/thunar.nix
        ../../modules/home-manager/mpv.nix
        ../../modules/home-manager/imv.nix
        ../../modules/home-manager/mako.nix
        ../../modules/home-manager/neovim.nix
        ../../modules/home-manager/fuzzel.nix

        ../../modules/home-manager/hyprland.nix
        ../../modules/home-manager/waybar.nix
        #../../modules/home-manager/river.nix
        #../../modules/home-manager/yambar.nix

        ../../modules/home-manager/screenshotting.nix
        ../../modules/home-manager/cursor.nix
        ../../modules/home-manager/dconf.nix
        ../../modules/home-manager/gtk.nix
        #../../modules/home-manager/qt.nix
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_STATE_HOME = "$HOME/.local/state";
        XDG_CACHE_HOME = "$HOME/.cache";
        CARGO_TARGET_DIR = "$HOME/Programming/CargoTarget";
        GOPATH = "$HOME/Programming/GoTarget";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
    home.stateVersion = "23.11";
}