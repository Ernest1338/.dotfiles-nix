{ lib, pkgs, ... }: {
    services.ntp.enable = true; # Faster than systemd-timesyncd
}
