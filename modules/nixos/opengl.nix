{ lib, pkgs, vars, ... }: {
    hardware.opengl.enable = true;
    hardware.opengl.driSupport = true;
    hardware.opengl.driSupport32Bit = true;
    # for laptop gpu
    boot.kernelParams = [ "radeon.si_support=0" "amdgpu.si_support=1" ];
}
