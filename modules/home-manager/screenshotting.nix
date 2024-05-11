{ lib, pkgs, ... }: {
  home.packages = with pkgs; [
    grim
    slurp
  ];
  # TODO: config
}
