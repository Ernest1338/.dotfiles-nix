{ lib, ... }: {
    boot.loader = {
        systemd-boot.enable = false;
        grub = {
            enable = true;
            copyKernels = true;
            efiInstallAsRemovable = true;
            efiSupport = true;
            devices = [ "nodev" ];
            useOSProber = false;
        };
    };
    # boot.loader.systemd-boot.enable = true;
    # boot.loader.efi.canTouchEfiVariables = true;
}
