{ lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        modules-left = [
          "hyprland/workspaces"
          #"wlr/taskbar"
          #"custom/media"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "custom/sound-switch"
          "custom/suspend"
          #"mpd"
          #"idle_inhibitor"
          #"pulseaudio"
          "network"
          #"power-profiles-daemon"
          "cpu"
          "memory"
          #"temperature"
          #"backlight"
          #"keyboard-state"
          #"wlr/language"
          #"battery"
          #"battery#bat2"
          "clock"
          #"tray"
        ];
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
        "custom/sound-switch" = {
          format = "sound-switch";
          on-click = ''

          '';
        };
        "custom/suspend" = {
          format="suspend";
          on-click=''

          '';
        };
      };
    };
  };
}
