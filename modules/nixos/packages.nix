{ lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    alacritty
    htop
    brave
    rofi-wayland
    wl-clipboard
    python3
    tmux
    ripgrep
    rustup
    lua-language-server
    lazygit
    waybar
    ncdu
    fd
    pulseaudio
    pavucontrol
    hyprlock
    uv
    ruff
  ];
}
