{ lib, ... }: {
    programs.bash = {
        enable = true;
        shellAliases = {
            "v" = "nvim";
            "vi"="nvim --noplugin -u NONE";
            "vim" = "nvim";
            "pyserv" = "python3 -m http.server 8080";
            "c" = "cd";
            "gc" = "nix-env --delete-generations old && nix-store --gc";
            "up" = "~/.dotfiles/update.sh; rustup update";
            "alpvm" = "sudo systemd-nspawn -q -x -D ~/Files/Containers/alpine";
            "gamingcont" = "sudo systemd-nspawn -q -D ~/Files/Containers/gaming -E DISPLAY=$DISPLAY -E XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR --bind=/dev/input --bind=/dev/dri --bind=/dev/shm --bind=/run/dbus/system_bus_socket --bind=/tmp/.X11-unix --bind=/dev/snd -E PULSE_SERVER=unix:$XDG_RUNTIME_DIR/pulse/native --bind=$XDG_RUNTIME_DIR --bind=$HOME/.config/pulse/cookie:/home/gamer/.config/pulse/cookie"; # -u gamer --bind=/etc/machine-id
        };
        initExtra = ''
export PS1="\[$(tput bold)\]\[\033[38;5;0m\]\[\033[48;5;11m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;255m\]\W\[$(tput sgr0)\]\[\033[38;5;11m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"

mnt() {
    if [ $# -lt 1 ]; then
        echo "Usage: mnt <device> <mount_directory_name>"
        return 1
    fi

    DEVICE=$1
    MOUNT_DIR=$2

    if [ -z "$MOUNT_DIR" ]; then
        MOUNT_DIR=$(echo $RANDOM | md5sum | head -c 20)
    fi

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
        echo "Press enter to umount..."
    else
        echo "Failed to mount $DEVICE"
        return 1
    fi

    read && sudo umount "$MOUNT_PATH" && sudo rmdir "$MOUNT_PATH" && echo "Successfully umounted $DEVICE"
}
        '';
    };
}
