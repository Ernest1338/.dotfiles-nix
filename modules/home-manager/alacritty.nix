{ lib, pkgs, ... }: {
  home.packages = with pkgs; [ alacritty ];
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
}
