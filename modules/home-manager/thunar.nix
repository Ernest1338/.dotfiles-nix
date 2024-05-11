{ lib, pkgs, ... }: {
    home.packages = with pkgs.xfce; [
        thunar
        thunar-archive-plugin
        thunar-volman
    ];
}
