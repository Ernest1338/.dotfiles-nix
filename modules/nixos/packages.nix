{ lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    wget
    htop
    brave
    rofi-wayland
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
  ];
}
