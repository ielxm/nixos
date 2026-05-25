{ pkgs, ... }:
{
  boot.loader.systemd-boot.configurationLimit = 9;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
