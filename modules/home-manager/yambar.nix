{ lib, pkgs, ... }: {
    home.packages = with pkgs; [
        yambar
        yambar-hyprland-wses
    ];
    programs.yambar = {
        enable = true;
        settings = {
            bar = {
                location = "top";
                height = 24;
                background = "00000066";
            };
        };
    };
    systemd.user.services.yambar = {
        Unit = {
            Description = "Yambar bar :)";
        };
        Install = {
            WantedBy = [ "hyprland-session.target" ];
        };
        Service = {
            ExecStart = "${pkgs.yambar}/bin/yambar";
        };
    };
}
