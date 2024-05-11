{ lib, pkgs, ... }: {
    home.packages = with pkgs; [ waybar ];
    programs.waybar = {
        enable = true;
        systemd = {
            enable = true;
            target = "hyprland-session.target";
        };
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
                modules-center = [ "hyprland/window" ];
                modules-right = [
                    "custom/sound-switch"
                    "custom/suspend"
                    #"hyprland/language"
                    #"idle_inhibitor"
                    "pulseaudio"
                    "network"
                    #"power-profiles-daemon"
                    "cpu"
                    "memory"
                    #"temperature"
                    #"backlight"
                    #"battery"
                    #"tray"
                    "clock"
                ];
                "hyprland/workspaces" = {
                    disable-scroll = true;
                    all-outputs = true;
                };
                "custom/sound-switch" = {
                    format = "<span background='lightgray'>   🎧   </span>";
                    on-click = ''
current=$(pactl list sinks | grep 'Active Port:' | grep 'analog' | cut -d' ' -f3)
if [[ $current == "analog-output-lineout" ]]; then
    pactl set-sink-port 0 analog-output-headphones
elif [[ $current == "analog-output-headphones" ]]; then
    pactl set-sink-port 0 analog-output-lineout
fi
                    '';
                };
                "custom/suspend" = {
                    format = "<span background='orange'>   ⏸️   </span>";
                    on-click = "systemctl suspend";
                };
                "pulseaudio" = {
                    on-click = "pavucontrol";
                };
                "network" = {
                    on-click = "alacritty -e sh -c 'nmtui'";
                };
                "clock" = {
                    on-click = "alacritty -e sh -c 'cal $(date +%Y); read'";
                };
            };
        };
    };
}
