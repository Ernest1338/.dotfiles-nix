{ lib, pkgs, vars, ... }: {
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            "$mod" = "ALT";
            "$terminal" = "alacritty";
            "$menu" = "fuzzel";
            "$screenshot" = "SCREENSHOT_PATH=\"$HOME/Pictures/Screenshots/$(date +%Y%m%d-%H%M%S).png\"; grim -g \"$(slurp)\" \"$SCREENSHOT_PATH\"; wl-copy < $SCREENSHOT_PATH";
            general = {
                border_size = 0; # 1
                gaps_in = 2;
                gaps_out = 0; # 4
                # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
                # "col.inactive_border" = "rgba(595959aa)";
                layout = "dwindle";
            };
            monitor = [
                # TODO: setup monitors on a real PC (conditional for laptop)
                "${(if vars.hostName == "nixos-laptop" then
                    "LVDS-1,1600x900@60,0x0,1"
                    else
                    "Virtual-1,1920x1080@75,0x0,1"
                )}"
            ];
            decoration = {
                rounding = 5;
                blur = {
                    enabled = false;
                    size = 3;
                    passes = 1;
                    vibrancy = 0.1696;
                };
                # layerrule = [
                #     "blur, waybar"
                # ];
                # drop_shadow = false;
                # shadow_range = 4;
                # shadow_render_power = 3;
                # "col.shadow" = "rgba(1a1a1aee)";
            };
            # touchpad needs to support gestures
            # gestures = {
            #     workspace_swipe = true;
            # };
            animations = {
                enabled = true;
                # bezier = [
                #     "myBezier, 0.65, 0, 0.35, 1"
                # ];
                animation = [
                    "windows, 1, 8, default, popin 80%"
                    #"windowsOut, 1, 8, default, popin 80%"
                    "border, 1, 10, default"
                    "borderangle, 1, 8, default"
                    "fade, 1, 7, default"
                    "workspaces, 1, 6, default, slidefade 20%"
                ];
            };
            dwindle = {
                preserve_split = true;
            };
            misc = {
                force_default_wallpaper = 0;
                disable_splash_rendering = true;
            };
            input = {
                kb_layout = "us, pl";
                kb_options = "caps:escape";
                repeat_delay = 300;
                repeat_rate = 40;
                numlock_by_default = true;
                touchpad = {
                    scroll_factor = 0.2;
                    natural_scroll = true;
                };
            };
            bindm = [
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ];
            bind = [
                "$mod Ctrl, T, exec, $terminal"
                "$mod, Return, exec, $terminal"
                "$mod Shift, Return, exec, $terminal"
                "$mod, Q, killactive"
                "$mod, M, exit"
                "$mod, W, fullscreen"
                "$mod, F, togglefloating"
                "$mod, P, exec, $menu"
                "$mod, Space, exec, $menu"
                # "Alt, Tab, cyclenext"
                # "Alt, Tab, bringactivetotop"
                "$mod, Tab, focuscurrentorlast"
                "$mod Ctrl Shift, L, exec, hyprlock --immediate"
                ", Print, exec, $screenshot"

                "$mod, H, focusmonitor, -1"
                "$mod, L, focusmonitor, +1"

                "$mod Shift, H, movewindow, -1"
                "$mod Shift, L, movewindow, +1"

                "$mod, Left, movefocus, l"
                "$mod, Right, movefocus, r"
                "$mod, Up, movefocus, u"
                "$mod, Down, movefocus, d"

                "$mod Shift, Left, resizeactive, -10 0"
                "$mod Shift, Right, resizeactive, 10 0"
                "$mod Shift, Up, resizeactive, 0 -10"
                "$mod Shift, Down, resizeactive, 0 10"
            ]
            ++ (
                # workspaces
                builtins.concatLists (builtins.genList (
                    x: let
                        ws = let
                                c = (x + 1) / 10;
                        in
                        builtins.toString (x + 1 - (c * 10));
                    in [
                        "$mod, ${ws}, workspace, ${toString (x + 1)}"
                        "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                    ]
                ) 10)
            );
        };
    };
}
