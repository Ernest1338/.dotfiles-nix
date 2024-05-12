{ lib, pkgs, ... }: {
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-emoji
        font-awesome
        (nerdfonts.override { fonts = [ "Hack" ]; })
    ];
}
