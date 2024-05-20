{ lib, ... }: {
    # Grub UEFI
    # boot.loader = {
    #     systemd-boot.enable = false;
    #     grub = {
    #         enable = true;
    #         copyKernels = true;
    #         efiInstallAsRemovable = true;
    #         efiSupport = true;
    #         devices = [ "nodev" ];
    #         useOSProber = false;
    #     };
    # };

    # Grub BIOS
    # boot.loader = {
    #     systemd-boot.enable = false;
    #     grub = {
    #         enable = true;
    #         copyKernels = true;
    #         devices = [ "nodev" ];
    #         useOSProber = false;
    #     };
    # };

    # Systemd-boot UEFI
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
}
