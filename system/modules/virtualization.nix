{ lib, config, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
  };

  users.users.${config.ndsl.primaryUser}.extraGroups = lib.mkAfter [ "libvirtd" ];

  imports = [
    ./pkgs/profiles/virtualization.nix
  ];
}
