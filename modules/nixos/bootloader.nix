{ lib, ... }: {
    boot.loader = {
        systemd-boot.enable = false;
        grub = {
            enable = true;
            devices = [ "nodev" ];
            useOSProber = false;
        };
    };
}
