{ lib, pkgs, ... }: {
    systemd.services.NetworkManager-wait-online.enable = false;
    # systemd.services.NetworkManager-dispatcher.enable = false;
    systemd.services.systemd-oomd.enable = false;
}
