{ lib, pkgs, ... }: {
    # NOTE: udiskie also needs to be enabled (home-manager module)
    services.udisks2.enable = true;
}
