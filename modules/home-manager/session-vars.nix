{ lib, pkgs, ... }: {
    home.sessionVariables = {
        EDITOR = "nvim";
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_STATE_HOME = "$HOME/.local/state";
        XDG_CACHE_HOME = "$HOME/.cache";
        CARGO_TARGET_DIR = "$HOME/Programming/CargoTarget";
        GOPATH = "$HOME/Programming/GoTarget";
        PATH = "$PATH:~/Repos/nspawn-registry/";
    };
}
