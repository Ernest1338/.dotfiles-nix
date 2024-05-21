{ lib, ... }: {
    networking = {
        networkmanager = {
            enable = true;
            dns = "none";
        };
        nameservers = [ "1.1.1.1" "9.9.9.9" ];
        # wireless.enable = true; # Enables wireless support via wpa_supplicant.
    };
    # systemd.services.NetworkManager-wait-online.enable = false;
}
