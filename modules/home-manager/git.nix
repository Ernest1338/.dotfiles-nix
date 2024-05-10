{ lib, pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Ernest Gupik";
    userEmail = "ernestgupik@wp.pl";
    extraConfig = {
      credential.helper = "store";
    };
  };
}
