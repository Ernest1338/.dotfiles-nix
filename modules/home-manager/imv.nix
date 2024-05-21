{ lib, pkgs, vars, ... }: {
    programs.imv = {
        enable = true;
        settings = {
            options.suppress_default_binds = true;
            binds = {
                "<Ctrl+Up>" = "zoom 1";
                "<Ctrl+Down>" = "zoom -1";
            };
        };
    };
}
