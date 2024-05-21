{ lib, ... }: {
    programs.bash = {
        enable = true;
        shellAliases = {
            "v" = "nvim";
            "vi"="nvim --noplugin -u NONE";
            "vim" = "nvim";
            "pyserv" = "python3 -m http.server 8080";
            "c" = "cd";
            "gc" = "sudo nix-collect-garbage -d && sudo nix-store --gc";
            "up" = "~/.dotfiles/update.sh; rustup update";
            "alpvm" = "sudo systemd-nspawn -x -D ~/Others/Containers/alpine";
            "gamingcont" = "sudo systemd-nspawn -x -D ~/Others/Containers/arch"; # TODO
        };
        initExtra = ''
export PS1="\[$(tput bold)\]\[\033[38;5;0m\]\[\033[48;5;11m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;255m\]\W\[$(tput sgr0)\]\[\033[38;5;11m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"

mnt() {
    if [ $# -ne 2 ]; then
        echo "Usage: mnt <device> <mount_directory_name>"
        return 1
    fi

    DEVICE=$1
    MOUNT_DIR=$2
    MOUNT_PATH="/run/media/$USER/$MOUNT_DIR"

    # Create the mount directory if it does not exist
    if [ ! -d "$MOUNT_PATH" ]; then
        sudo mkdir -p "$MOUNT_PATH"
    fi

    # Mount the device
    sudo mount "$DEVICE" "$MOUNT_PATH"

    # Check if the mount was successful
    if [ $? -eq 0 ]; then
        echo "Successfully mounted $DEVICE to $MOUNT_PATH"
    else
        echo "Failed to mount $DEVICE"
        return 1
    fi
}
        '';
    };
}
