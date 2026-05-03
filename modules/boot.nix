{ pkgs, ... }:

{

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false; # prevent user from entering systemd-boot editor

  # Prevent NixOS from creating too many boot entries
  # Limit amount of system backups --->
  boot.loader.systemd-boot.configurationLimit = 9;

  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
