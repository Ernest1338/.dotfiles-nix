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
        alacritty
        brave
        dconf
        fuzzel
        git
        imv
        mako
        mpv
        neovim
        tmux
        # pcmanfm
        # adwaita-qt
        # adwaita-qt6
        # river
        # yambar

        # thunar
        xfce.thunar
        xfce.thunar-archive-plugin
        xfce.thunar-volman

        # screenshotting
        grim
        slurp

        # hyprland
        hyprland
        hyprpicker
        hyprlock
        waybar

        # sound
        pulseaudio
        pavucontrol
    ];
}
