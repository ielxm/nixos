{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false; # запретить редактирование параметров ядра при загрузке системы
  boot.loader.systemd-boot.configurationLimit = 9;

  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest; # использовать последнюю версию ядра
}
