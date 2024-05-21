{ lib, pkgs, ... }: {
    hardware.opengl.enable = true;
    hardware.opengl.driSupport32Bit = true;
}
