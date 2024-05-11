{ lib, pkgs, ... }: {
    home.packages = with pkgs; [ dconf ];
    dconf = {
        enable = true;
        settings = {
            "org/gnome/desktop/interface" = {
                color-scheme = "prefer-dark";
            };
        };
    };
}
