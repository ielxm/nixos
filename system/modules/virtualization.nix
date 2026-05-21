{ lib, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
  };

  users.users.ielxm.extraGroups = lib.mkAfter [ "libvirtd" ];

  imports = [
    ./pkgs/profiles/virtualization.nix
  ];
}
