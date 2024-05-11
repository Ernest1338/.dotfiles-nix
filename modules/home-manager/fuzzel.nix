{ lib, pkgs, ... }: {
    home.packages = with pkgs; [ fuzzel ];
    programs.fuzzel = {
        enable = true;
    };
}
