{ lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pulseaudio
    pavucontrol
  ];
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };
}
