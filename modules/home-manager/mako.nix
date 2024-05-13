{ lib, pkgs, ... }: {
    home.packages = with pkgs; [ mako ];
    services.mako = {
        enable = true;
        backgroundColor = "#2b3035ff";
        textColor = "#ebdbb2ff";
    };
}
