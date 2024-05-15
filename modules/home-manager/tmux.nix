{ lib, pkgs, ... }: {
    programs.tmux = {
        enable = true;
        mouse = true;
        keyMode = "vi";
        prefix = "C-s";
        extraConfig = ''
set -g status-style 'bg=#282828'
setw -g window-status-current-style 'fg=black,bg=gray'
bind-key -n S-Left previous-window
bind-key -n S-Right next-window
        '';
        customPaneNavigationAndResize = true;
    };
}
