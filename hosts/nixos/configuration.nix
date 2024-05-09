{ inputs, lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos/nix.nix
      ../../modules/nixos/bootloader.nix
      ../../modules/nixos/input.nix
      ../../modules/nixos/locale.nix
      ../../modules/nixos/fonts.nix
      ../../modules/nixos/networking.nix
      inputs.home-manager.nixosModules.default
    ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  networking.hostName = "nixos";
  users.users = {
    dvdnix = {
      isNormalUser = true;
      description = "dvdnix";
      extraGroups = [ "networkmanager" "wheel" "input" ];
      packages = with pkgs; [];
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    alacritty
    greetd.tuigreet
    htop
    brave
    rofi-wayland
    wl-clipboard
    python3
    tmux
    ripgrep
    rustup
    lua-language-server
    lazygit
    waybar
    ncdu
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "dvdnix" = import ./home.nix;
    };
  };

  environment.sessionVariables = { };

  programs.hyprland.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --user-menu --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];

  system.stateVersion = "23.11";
}
