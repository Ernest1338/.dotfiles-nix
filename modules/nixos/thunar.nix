{ lib, pkgs, ... }: {
    # NOTE: this should be a home-manager module but it isn't (home-manager doesn't support thunar)
    # TODO: better theme, dark theme
    # TODO: working unarchive, volume mounting
    programs.thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
            thunar-archive-plugin
            thunar-volman
        ];
    };
}
