{ config, lib, ... }:
{
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

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    #package = config.boot.kernelPackages.nvidiaPackages.beta;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };
}
