{ inputs, lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos/nix.nix
      ../../modules/nixos/bootloader.nix
      ../../modules/nixos/packages.nix
      ../../modules/nixos/input.nix
      ../../modules/nixos/locale.nix
      ../../modules/nixos/fonts.nix
      ../../modules/nixos/networking.nix
      ../../modules/nixos/sound.nix
      ../../modules/nixos/thunar.nix
      ../../modules/nixos/display-manager.nix
      inputs.home-manager.nixosModules.default
    ];

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
    extraSpecialArgs = {inherit inputs;};
    users = {
      "dvdnix" = import ./home.nix;
    };
  };

  programs.hyprland.enable = true;
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];

  system.stateVersion = "23.11";
}
