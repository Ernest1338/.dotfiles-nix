{ lib, ... }: {
    # i2c required for controlling display brightness
    hardware.i2c.enable = true;
    # support for AMD gpu
    boot.initrd.kernelModules = [ "amdgpu" ];
}
