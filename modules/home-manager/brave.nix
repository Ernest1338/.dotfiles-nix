{ lib, pkgs, ... }: {
    home.packages = with pkgs; [ brave ];
    # programs.chromium = {};
}
