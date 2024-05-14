{ lib, pkgs, ... }: {
    home.packages = with pkgs; [ river ];
    wayland.windowManager.river = {
        enable = true;
        settings = {
            map = {
                normal = {
                    "Alt+Shift Return" = "spawn alacritty";
                    "Alt Return" = "spawn alacritty";
                    "Ctrl+Alt T" = "spawn alacritty";
                    "Alt Q" = "close";
                    "Alt M" = "exit";
                    "Alt W" = "toggle-fullscreen";
                    "Alt P" = "spawn fuzzel";
                };
            };
            map-pointer = {
                normat = {
                    "Alt BTN_LEFT" = "move-view";
                    "Alt BTN_RIGHT" = "resize-view";
                };
            };
        };
        extraConfig = ''
for i in $(seq 1 9)
do
    tags=$((1 << ($i - 1)))
    riverctl map normal Alt $i set-focused-tags $tags
    riverctl map normal Alt+Shift $i set-view-tags $tags
    riverctl map normal Alt+Control $i toggle-focused-tags $tags
    riverctl map normal Alt+Shift+Control $i toggle-view-tags $tags
done

riverctl background-color 0x002b36
riverctl border-width 1
riverctl border-color-focused 0x93a1a1
riverctl border-color-unfocused 0x586e75

riverctl set-repeat 40 300

riverctl rule-add -app-id "bar" csd

riverctl default-layout rivertile
rivertile -view-padding 2 -outer-padding 4 &
        '';
    };
}
