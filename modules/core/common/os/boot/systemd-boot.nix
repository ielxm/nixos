{
  config,
  lib,
  ...
}: let
  inherit (lib) mkDefault mkIf

in {
  boot.loader = {
    systemd-boot = {
      enable = mkDefault true;

      editor = false;
    }
  }
}
