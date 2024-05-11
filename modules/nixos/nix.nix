{ lib, inputs, config, ... }: {
    nix = let
        flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in {
        settings = {
            experimental-features = "nix-command flakes";
            warn-dirty = false;
            flake-registry = "";
            nix-path = config.nix.nixPath;
        };
        channel.enable = false;
        registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
        nixPath = lib.mapAttrsToList (n: _: "${n}") flakeInputs;
    };

    nixpkgs = {
        config = {
            allowUnfree = true;
        };
    };
}
