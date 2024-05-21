{ config, pkgs, inputs, ... }:

{
    home.username = "dvdnix";
    home.homeDirectory = "/home/dvdnix";

    imports = [
        ../../modules/home-manager/session-vars.nix

        ../../modules/home-manager/bash.nix
        ../../modules/home-manager/git.nix
        ../../modules/home-manager/tmux.nix
        ../../modules/home-manager/alacritty.nix
        ../../modules/home-manager/mako.nix
        ../../modules/home-manager/fuzzel.nix
        ../../modules/home-manager/hyprlock.nix
        ../../modules/home-manager/udiskie.nix

        ../../modules/home-manager/hyprland.nix
        ../../modules/home-manager/waybar.nix
        # ../../modules/home-manager/river.nix
        # ../../modules/home-manager/yambar.nix

        ../../modules/home-manager/cursor.nix
        ../../modules/home-manager/dconf.nix
        ../../modules/home-manager/gtk.nix
        # ../../modules/home-manager/qt.nix
    ];

    # NOTE: If want to diverge session variables, remove from session-vars.nix and put here
    # home.sessionVariables = { };

    programs.home-manager.enable = true;
    home.stateVersion = "23.11";
}
