{ lib, pkgs, ... }: {
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-emoji
        font-awesome
        #line-awesome
        (nerdfonts.override { fonts = [ "Hack" ]; })
    ];
}
