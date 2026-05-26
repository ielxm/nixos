{ config, pkgs, lib, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
  };

  users.users.${config.ndsl.primaryUser}.extraGroups = lib.mkAfter [ "libvirtd" ];

  programs.virt-manager = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    dnsmasq
  ];

  boot.initrd.kernelModules = [
    "vfio_pci"
    "vfio"
    "vfio_iommu_type1"
  ];

  boot.kernelParams = [
    "amd_iommu=on"
  ]++lib.optionals (config.ndsl.hostname=="nyx") [
    "vfio-pci.ids=10de:1f0a,10de:10f9"
  ];
}
