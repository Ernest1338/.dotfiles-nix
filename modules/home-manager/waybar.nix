{ lib, pkgs, vars, ... }: {
    programs.waybar = {
        enable = true;
        systemd = {
            enable = true;
            target = "hyprland-session.target";
        };
        settings = {
            mainBar = {
                layer = "top";
                position = "bottom";
                output = [ "Virtual-1" ]; # TODO: switch monitor on a real PC
                height = 24;
                modules-left = [
                    "hyprland/workspaces"
                    #"tray"
                ];
                modules-center = [ "hyprland/window" ];
                modules-right = [
                    "custom/suspend"
                    "custom/picker"
                    "hyprland/language"
                    #"idle_inhibitor"
                    "pulseaudio"
                    "network"
                    "power-profiles-daemon"
                    "cpu"
                    "memory"
                    #"temperature"
                    "backlight"
                    "battery"
                    "clock"
                ];
                "hyprland/workspaces" = {
                    "persistent-workspaces" = {
                        "*" = 10;
                    };
                    #disable-scroll = true;
                    #all-outputs = true;
                    # format = "{icon}";
                    # format-icons = {
                    #     default = "○";
                    #     active = "●";
                    #     urgent = "⊛";
                    # };
                };
                "custom/suspend" = {
                    format = " ";
                    on-click = "systemctl suspend";
                };
                "custom/picker" = {
                    format = " ";
                    on-click = "hyprpicker -a"; # TODO: fix (clipboard) (something related to using ${pkgs.x}/bin/x?)
                };
                "pulseaudio" = {
                    format = "   {1}%";
                    on-click = ''
current=$(pactl list sinks | grep 'Active Port:' | grep 'analog' | cut -d' ' -f3)
if [[ $current == "analog-output-lineout" ]]; then
    pactl set-sink-port 0 analog-output-headphones
elif [[ $current == "analog-output-headphones" ]]; then
    pactl set-sink-port 0 analog-output-lineout
fi
                    '';
                    on-click-right = "pavucontrol";
                };
                "network" = {
                    format-ethernet = "   {ifname}";
                    format-wifi = "   {essid}";
                    format-disconnected = " ";
                    on-click = "alacritty -e bash -c 'nmtui'";
                };
                "clock" = {
                    format = "  {:%d/%m     %H:%M}";
                    on-click = "alacritty -e bash -c 'cal $(date +%Y); read'";
                };
                "memory" = {
                    format = "   {0}%";
                    on-click = "alacritty -e bash -c 'htop -s PERCENT_MEM'";
                };
                "cpu" = {
                    format = "   {1}%";
                    on-click = "alacritty -e bash -c 'htop -s PERCENT_CPU'";
                };
                "hyprland/language" = {
                    format = "   {1}";
                    on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next"; # TODO: switch device on a real PC
                };
                "battery" = {
                    format = "   {}%";
                };
                "power-profiles-daemon" = {
                    format = "   {}";
                };
                "backlight" = {
                    format = "   {}";
                };
            };
        };
        style = ''
* {
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
    font-size: 13px;
    font-weight: bold;
    color: #cccccc;
}

window#waybar {
    background-color: rgba(43, 48, 59, 0.5);
    border-top: 2px solid rgba(100, 114, 125, 0.5);
    transition-property: background-color;
    transition-duration: .5s;
}

window#waybar.hidden {
    opacity: 0.2;
}

/*
window#waybar.empty {
    background-color: transparent;
}
window#waybar.solo {
    background-color: #FFFFFF;
}
*/

window#waybar.termite {
    background-color: #3F3F3F;
}

window#waybar.chromium {
    background-color: #000000;
    border: none;
}

button {
    /* Use box-shadow instead of border so the text isn't offset */
    box-shadow: inset 0 -3px transparent;
    /* Avoid rounded borders under each button name */
    border: none;
    border-radius: 0;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
    background: inherit;
    box-shadow: inset 0 -3px #ffffff;
}

#pulseaudio:hover,
#network:hover,
#cpu:hover,
#memory:hover,
#clock:hover,
#language:hover,
#custom-suspend:hover,
#custom-picker:hover {
    background: rgba(0, 0, 0, 0.2);
}

#workspaces button {
    padding: 0 5px;
    background-color: rgba(100, 114, 125, 0.2);
    /* border-bottom: 2px solid rgba(100, 114, 125, 0.5); */
    color: #ffffff;
}

#workspaces button.empty {
    border: none;
    background: transparent;
}

#workspaces button.active {
    background-color: rgba(100, 114, 125, 0.7);
}

#workspaces button:hover {
    background: rgba(0, 0, 0, 0.2);
}

#workspaces button.focused {
    background-color: #64727D;
    box-shadow: inset 0 -3px #ffffff;
}

#workspaces button.urgent {
    background-color: #eb4d4b;
}

#mode {
    background-color: #64727D;
    box-shadow: inset 0 -3px #ffffff;
}

#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#pulseaudio,
#wireplumber,
#custom-media,
#tray,
#mode,
#idle_inhibitor,
#scratchpad,
#power-profiles-daemon,
#language,
#custom-picker,
#custom-suspend,
#mpd {
    padding: 0 10px;
}

#window,
#workspaces {
    margin: 0 4px;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

#clock {
    background: transparent;
}

#battery {
    background: transparent;
}

#battery.charging, #battery.plugged {
    background-color: #26A65B;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}

/* Using steps() instead of linear as a timing function to limit cpu usage */
#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: steps(12);
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#power-profiles-daemon {
    padding-right: 15px;
}

#power-profiles-daemon.performance {
    background: transparent;
    color: #f53c3c;
}

#power-profiles-daemon.balanced {
    background: transparent;
    color: #2980b9;
}

#power-profiles-daemon.power-saver {
    background: transparent;
    color: #2ecc71;
}

label:focus {
    background-color: #000000;
}

#cpu {
    background: transparent;
}

#memory {
    background: transparent;
}

#disk {
    background-color: #964B00;
}

#backlight {
    background: transparent;
}

#network {
    background: transparent;
}

#network.disconnected {
    background-color: #f53c3c;
}

#pulseaudio {
    background: transparent;
}

#pulseaudio.muted {
    background-color: #90b1b1;
    color: #2a5c45;
}

#wireplumber {
    background-color: #fff0f5;
    color: #000000;
}

#wireplumber.muted {
    background-color: #f53c3c;
}

#custom-media {
    background-color: #66cc99;
    color: #2a5c45;
    min-width: 100px;
}

#custom-media.custom-spotify {
    background-color: #66cc99;
}

#custom-media.custom-vlc {
    background-color: #ffa000;
}

#temperature {
    background-color: #f0932b;
}

#temperature.critical {
    background-color: #eb4d4b;
}

#tray {
    background-color: #2980b9;
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    background-color: #eb4d4b;
}

#idle_inhibitor {
    background-color: #2d3436;
}

#idle_inhibitor.activated {
    background-color: #ecf0f1;
    color: #2d3436;
}

#mpd {
    background-color: #66cc99;
    color: #2a5c45;
}

#mpd.disconnected {
    background-color: #f53c3c;
}

#mpd.stopped {
    background-color: #90b1b1;
}

#mpd.paused {
    background-color: #51a37a;
}

#language {
    background: transparent;
}

#keyboard-state {
    background: #97e1ad;
    color: #000000;
    padding: 0 0px;
    margin: 0 5px;
    min-width: 16px;
}

#keyboard-state > label {
    padding: 0 5px;
}

#keyboard-state > label.locked {
    background: rgba(0, 0, 0, 0.2);
}

#scratchpad {
    background: rgba(0, 0, 0, 0.2);
}

#scratchpad.empty {
	background-color: transparent;
}

#privacy {
    padding: 0;
}

#privacy-item {
    padding: 0 5px;
    color: white;
}

#privacy-item.screenshare {
    background-color: #cf5700;
}

#privacy-item.audio-in {
    background-color: #1ca000;
}

#privacy-item.audio-out {
    background-color: #0069d4;
}
        '';
    };
}
