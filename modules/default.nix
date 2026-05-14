{ pkgs, ... }:
{
  imports = [
    ./kernelParameters.nix
    ./virtualization.nix
    ./security.nix
    ./network.nix
    ./tty.nix
    ./systemServices.nix
    ./systemPrograms.nix
    ./systemPackages.nix
    ./systemUsers.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  # Запретить редактирование параметров ядра при загрузке
  boot.loader.systemd-boot.editor = false;

  # Ограничить максимальное количество активных бэкапов в списке Boot Entries
  boot.loader.systemd-boot.configurationLimit = 9;

  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest; # использовать последнюю версию ядра

  # Часовой пояс
  time.timeZone = "Europe/Moscow";

  # Локаль
  i18n.defaultLocale = "en_US.UTF-8";

  # Системные переменные окружения
  environment.variables = {
    EDITOR = "hx";
  };

  # Необходимо для корректной работы xdg-desktop-portal, если он установлен посредством Home Manager'а
  environment.pathsToLink = [ "share/applications" "/share/xdg-desktop-portal" ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}
