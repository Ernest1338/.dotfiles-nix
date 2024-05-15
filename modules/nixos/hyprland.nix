{ lib, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        hyprland
        hyprpicker
        hyprlock
    ];
    programs.hyprland.enable = true;
}
