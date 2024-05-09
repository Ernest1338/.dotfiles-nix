{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dvdnix";
  home.homeDirectory = "/home/dvdnix";

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "ALT";
      "$terminal" = "alacritty";
      "$menu" = "rofi -show drun";
      "$window_switcher" = "rofi -show window";
      "monitor" = ",preferred,auto,auto";
      general = {
        border_size = 2;
        gaps_in = 5;
        gaps_out = 5;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
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
          "windows, 1, 7, myBezier"
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
        "$mod, Return, exec, $terminal"
        "$mod SHIFT, Return, exec, $terminal"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, W, togglefloating"
        "$mod, P, exec, $menu"
        "Ctrl, Space, exec, $window_switcher"
        "Alt, Tab, cyclenext"
        "Alt, Tab, bringactivetotop"

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

  programs.bash = {
    enable = true;
    shellAliases = {
      "v" = "nvim";
      "vi"="nvim --noplugin -u NONE";
      "vim" = "nvim";
      "pyserv" = "python3 -m http.server 8080";
      "c" = "cd";
    };
    initExtra = ''
export PS1="\[$(tput bold)\]\[\033[38;5;0m\]\[\033[48;5;11m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;255m\]\W\[$(tput sgr0)\]\[\033[38;5;11m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"
    '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 11.5;
      };
      font.normal = {
        family = "Hack Nerd Font";
        style = "Regular";
      };
      cursor = {
        blink_interval = 500;
      };
      cursor.style = {
        blinking = "on";
        shape = "Beam";
      };
      window = {
        decorations = "none";
      };
      colors.primary = {
        background = "0x282828";
        foreground = "0xebdbb2";
      };
      colors.normal = {
        black = "0x282828";
        blue = "0x458588";
        cyan = "0x689d6a";
        green = "0x98971a";
        magenta = "0xb16286";
        red = "0xcc241d";
        white = "0xa89984";
        yellow = "0xd79921";
      };
      colors.bright = {
        black = "0x928374";
        blue = "0x83a598";
        cyan = "0x8ec07c";
        green = "0xb8bb26";
        magenta = "0xd3869b";
        red = "0xfb4934";
        white = "0xebdbb2";
        yellow = "0xfabd2f";
      };
    };
  };

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

  # programs.lazygit = {
  #   enable = true;
  #   settings = { };
  # };

  programs.waybar = {
    enable = true;
    settings = {
      systemd.enable = true;
    };
  };

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = with pkgs; [ ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_DATA_HOME = "/home/dvdnix/.local/share";
    XDG_CONFIG_HOME = "/home/dvdnix/.config";
    XDG_STATE_HOME = "/home/dvdnix/.local/state";
    XDG_CACHE_HOME = "/home/dvdnix/.cache";
    CARGO_TARGET_DIR = "/home/dvdnix/Programming/CargoTarget";
    GOPATH = "/home/dvdnix/Programming/GoTarget";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
