{ lib, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        wget
        htop
        ripgrep
        fd
        ncdu
        git
        neovim
        tmux
        # pcmanfm
        # adwaita-qt
        # adwaita-qt6
        # river
        # yambar
    ];
}
