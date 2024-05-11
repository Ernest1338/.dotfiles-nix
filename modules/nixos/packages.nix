{ lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
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
    fuzzel
  ];
}
