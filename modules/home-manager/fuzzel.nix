{ lib, pkgs, ... }: {
    home.packages = with pkgs; [ fuzzel ];
    programs.fuzzel = {
        enable = true;
        settings = {
            colors = {
                background = "3c3836ff";
                selection = "504945ff";
                selection-text = "fbf1c7ff";
                text = "ebdbb2ff";
                border = "1d2021ff";
            };
            main = {
                width = 50;
            };
        };
    };
}
