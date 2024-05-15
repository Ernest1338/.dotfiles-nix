{ inputs, lib, config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../modules/nixos/nix.nix
        ../../modules/nixos/bootloader.nix
        ../../modules/nixos/base-packages.nix
        ../../modules/nixos/input.nix
        ../../modules/nixos/locale.nix
        ../../modules/nixos/fonts.nix
        ../../modules/nixos/networking.nix
        ../../modules/nixos/sound.nix
        ../../modules/nixos/display-manager.nix
        ../../modules/nixos/ld-fix.nix
        ../../modules/nixos/hyprland.nix
        # ../../modules/nixos/opengl.nix
        # ../../modules/nixos/auto-upgrade.nix
        inputs.home-manager.nixosModules.default
    ];

    environment.systemPackages = with pkgs; [
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
    ];

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

    system.stateVersion = "23.11";
}
