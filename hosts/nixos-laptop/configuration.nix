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
        ../../modules/nixos/startup-optimization-tweaks.nix
        ../../modules/nixos/opengl.nix
        # ../../modules/nixos/auto-disk-mount.nix
        # ../../modules/nixos/auto-upgrade.nix
        ../../modules/nixos/laptop.nix
        inputs.home-manager.nixosModules.default
    ];

    # environment.systemPackages = with pkgs; [ ];

    networking.hostName = "nixos-laptop";
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
                hostName = "nixos-laptop";
            };
        };
        users = {
            "dvdnix" = import ./home.nix;
        };
    };

    # support for AMD gpu
    # boot.initrd.kernelModules = [ "amdgpu" ];
    # boot.kernelParams = [ "radeon.si_support=0" "amdgpu.si_support=1" ];

    system.stateVersion = "23.11";
}
