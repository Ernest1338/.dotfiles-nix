{ lib, ... }: {
    boot.loader = {
        systemd-boot.enable = false;
        grub = {
            enable = true;
            device = "nodev";
            useOSProber = false;
        };
    };
}
