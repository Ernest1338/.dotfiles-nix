{ lib, pkgs, ... }: {
    home.packages = with pkgs; [ fuzzel ];
    programs.fuzzel = {
        enable = true;
        settings = {
            colors = {
                background = "2b3035ff";
                selection = "353a3fff";
                selection-text = "fbf1c7ff";
                text = "ebdbb2ff";
                border = "1d2021ff";
            };
            main = {
                width = 50;
                line-height = 20;
            };
            key-bindings = {
                prev-with-wrap = "Up Shift+Tab";
                next-with-wrap = "Down Tab";
            };
        };
    };
}
