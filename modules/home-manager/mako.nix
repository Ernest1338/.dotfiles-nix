{ lib, pkgs, ... }: {
    home.packages = with pkgs; [ mako ];
    services.mako = {
        enable = true;
    };
}
