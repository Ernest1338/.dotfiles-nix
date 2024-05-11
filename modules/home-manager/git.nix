{ lib, pkgs, ... }: {
    home.packages = with pkgs; [ git ];
    programs.git = {
        enable = true;
        userName = "Ernest Gupik";
        userEmail = "ernestgupik@wp.pl";
        extraConfig = {
            credential.helper = "store";
        };
    };
}
