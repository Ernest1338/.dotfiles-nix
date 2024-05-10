{ lib, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "ALT";
      "$terminal" = "alacritty";
      "$menu" = "rofi -show drun";
      "$window_switcher" = "rofi -show window";
      "monitor" = ",preferred,auto,auto";
      general = {
        border_size = 1;
        gaps_in = 2;
        gaps_out = 4;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };
      decoration = {
        rounding = 5;
        blur = {
          enabled = false;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
        drop_shadow = false;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
      animations = {
        enabled = true;
        bezier = [
          "myBezier, 0.65, 0, 0.35, 1"
        ];
        animation = [
          #"windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      dwindle = {
        preserve_split = true;
      };
      misc = {
        force_default_wallpaper = 0;
      };
      input = {
          kb_layout = "us";
          kb_options = "caps:escape";
          repeat_delay = 300;
          repeat_rate = 40;
      };
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bind = [
        "$mod Ctrl, T, exec, $terminal"
        "$mod Shift, Return, exec, $terminal"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, W, togglefloating"
        "$mod, P, exec, $menu"
        "$mod, Space, exec, $menu"
        "Ctrl, Space, exec, $window_switcher"
        "Alt, Tab, cyclenext"
        "Alt, Tab, bringactivetotop"
        "Super, L, exec, hyprlock"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
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
        )
        10)
      );
    };
  };
}
