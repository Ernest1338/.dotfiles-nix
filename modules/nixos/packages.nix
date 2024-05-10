{ lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    wget
    htop
    brave
    wl-clipboard
    python3
    ripgrep
    rustup
    lua-language-server
    lazygit
    ncdu
    fd
    uv
    ruff
    qemu
    ffmpeg
    rofi-wayland # TODO: configure with home-manager (maybe just rofi, not rofi-wayland?)
  ];
}
