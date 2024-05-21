{ inputs, lib, config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../modules/nixos/nix.nix
        ../../modules/nixos/bootloader.nix
        ../../modules/nixos/kernel.nix
        ../../modules/nixos/packages.nix
        ../../modules/nixos/input.nix
        ../../modules/nixos/locale.nix
        ../../modules/nixos/fonts.nix
        ../../modules/nixos/networking.nix
        ../../modules/nixos/sound.nix
        ../../modules/nixos/display-manager.nix
        ../../modules/nixos/ld-fix.nix
        ../../modules/nixos/hyprland.nix
        ../../modules/nixos/firewall.nix
        ../../modules/nixos/timesync.nix
        # ../../modules/nixos/auto-disk-mount.nix
        # ../../modules/nixos/opengl.nix
        # ../../modules/nixos/auto-upgrade.nix
        inputs.home-manager.nixosModules.default
    ];

    # environment.systemPackages = with pkgs; [ ];

    networking.hostName = "nixos";
    users.users = {
        dvdnix = {
            isNormalUser = true;
            description = "dvdnix";
            extraGroups = [ "networkmanager" "wheel" "input" ];
            packages = with pkgs; [];
        };
    };

    home-manager = {
        extraSpecialArgs = {
            inherit inputs;
            vars = {
                hostName = "nixos";
            };
        };
        users = {
            "dvdnix" = import ./home.nix;
        };
    };

    system.stateVersion = "23.11";
}
