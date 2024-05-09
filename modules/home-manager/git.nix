{ lib, ... }: {
  programs.git = {
    enable = true;
    extraConfig = {
      credential.helper = "store";
    };
  };
}
