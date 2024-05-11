{ lib, ... }: {
    programs.bash = {
        enable = true;
        shellAliases = {
            "v" = "nvim";
            "vi"="nvim --noplugin -u NONE";
            "vim" = "nvim";
            "pyserv" = "python3 -m http.server 8080";
            "c" = "cd";
            "gc" = "nix-collect-garbage -d && nix-store --gc";
            "up" = "~/.dotfiles/update.sh; rustup update";
            "alpvm" = "sudo systemd-nspawn -x -D ~/Others/Containers/alpine";
            "gamingcont" = "sudo systemd-nspawn -x -D ~/Others/Containers/arch";
        };
        initExtra = ''
export PS1="\[$(tput bold)\]\[\033[38;5;0m\]\[\033[48;5;11m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;255m\]\W\[$(tput sgr0)\]\[\033[38;5;11m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"
        '';
    };
}
