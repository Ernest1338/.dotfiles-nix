{ lib, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        # [[ base packages ]]
        wget
        htop
        ripgrep
        fd
        ncdu
        git
        neovim
        tmux

        # [[ might want to diverge configs from here ]]

        # [[ wayland ]]
        wl-clipboard
        fuzzel
        waybar
        mako
        imv

        # [[ thunar ]]
        xfce.thunar
        xfce.thunar-archive-plugin
        xfce.thunar-volman

        # [[ screenshotting ]]
        grim
        slurp

        # [[ others ]]
        python3
        uv
        rustup
        qemu
        ffmpeg
        alacritty
        brave
        dconf
        mpv
        lazygit
        # pcmanfm
        # adwaita-qt
        # adwaita-qt6
        # river
        # yambar
    ];
}
