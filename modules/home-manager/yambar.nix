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
                foreground = "ffffffff";
                background = "111111cc";
                #border = {
                #    width = 1;
                #    color = "999999cc";
                #    top-margin = 0;
                #};
                right = [ {
                    clock.content = [ { string.text = "{time}"; } ];
                } ];
                #left = [ {
                    #script = {
                    #    path = "${pkgs.yambar-hyprland-wses}/bin/yambar-hyprland-wses";
                    #    anchors = {
                    #        "ws_focused" = "&ws_focused fba922ff";
                    #        "ws_active" = "&ws_active ffaa00ff";
                    #        "ws_empty" = "&ws_empty 555555ff";
                    #        "ws_other" = "&ws_other bbbbbbff";

                    #        "ws_1" = "&ws1 \"I\"";
                    #    };
                    #    content.list = [
                    #        map {
                    #            default.string = "{ text: *ws_1, foreground: *ws_other}";
                    #            conditions = {
                    #                "workspace_count < 2" = "empty: {}";
                    #                workspace_1_focused.string = "{ text: *ws_1, foreground: *ws_focused}";
                    #                workspace_1_active.string = "{ text: *ws_1, foreground: *ws_active}";
                    #                "workspace_1_windows == 0".string = "{ text: *ws_1, foreground: *ws_empty}";
                    #            };
                    #        }
                    #    ];
                    #};
                #} ];
            };
        };
    };
    systemd.user.services.yambar = {
        Unit = {
            Description = "Yambar bar :)";
            PartOf = [ "graphical-session.target" ];
            After = [ "graphical-session-pre.target" ];
        };
        Install = {
            WantedBy = [ "river-session.target" ];
        };
        Service = {
            ExecStart = "${pkgs.yambar}/bin/yambar";
            ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR3 $MAINPID";
            Restart = "on-failure";
            KillMode = "mixed";
        };
    };
}
