{ lib, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        wget
        htop
        brave
        wl-clipboard
        python3
        ripgrep
        rustup
        lazygit
        ncdu
        fd
        uv
        ruff
        qemu
        ffmpeg
    ];
}
