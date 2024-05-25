{ lib, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        # [[ base packages ]]
        wget
        htop
        ripgrep
        fd
        ncdu
        git
        neovim-unwrapped
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
        python312Full
        python312Packages.python-lsp-server
        uv
        rustup
        qemu
        ffmpeg
        alacritty
        brave
        dconf
        mpv
        lazygit
        lua-language-server
        python312Packages.tkinter
        tk
        # udiskie
        # pcmanfm
        # adwaita-qt
        # adwaita-qt6
        # river
        # yambar
    ];
}
