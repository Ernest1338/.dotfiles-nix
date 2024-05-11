{ lib, pkgs, ... }: {
    home.packages = with pkgs; [
        adwaita-qt
        adwaita-qt6
    ];
    qt = {
        enable = true;
        style.name = "adwaita-dark";
    };
}
