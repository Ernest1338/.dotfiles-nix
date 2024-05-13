{ lib, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        wget
        htop
        wl-clipboard
        python3
        ripgrep
        rustup
        lazygit
        ncdu
        fd
        uv
        qemu
        ffmpeg
    ];
}
