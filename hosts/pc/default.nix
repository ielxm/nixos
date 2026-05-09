{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./network.nix
  ];

  boot.initrd.kernelModules = [ 
    "vfio_pci"
    "vfio"
    "vfio_iommu_type1"
   ];

  boot.kernelParams = [ 
    "amd_iommu=on"
    "vfio-pci.ids=10de:1f0a,10de:10f9"
    "video=DP-2:1920x1080@60"
  ];

	services.xserver.videoDrivers = [ "nvidia" ];

	hardware = {
    graphics = {
      enable = true;
    };
		nvidia = {
			open = true;
			modesetting.enable = true;
		};
	};

  security = {
    polkit = {
      enable = true;
    };
    pam = {
      #services.greetd.enableGnomeKeyring = true;
      services.login.enableGnomeKeyring = true;
    };
  };

  console = {
    packages = with pkgs; [ terminus_font ];
    earlySetup = true;
    font = "ter-u16b";
    keyMap = "us";
  };

  users.users.ielxm = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" ];
    packages = with pkgs; [];
  };

  services.mullvad-vpn = {
    enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  services.displayManager.gdm = {
    enable = true;
  };
  services.xserver.displayManager.sessionPackages = [ pkgs.sway ];

  services.gnome.gnome-keyring = {
    enable = true;
  };

  #services.greetd = {
  #  enable = true;
  #  settings = rec {
  #    initial_session = {
  #      command = "sway --unsupported-gpu";
  #      user = "ielxm";
  #    };
  #    default_session = initial_session;
  #  };
  #};

  #environment.variables.XDG_RUNTIME_DIR = "/run/user/$UID";

  environment.systemPackages = with pkgs; [
    tree
    htop
    yazi
    gcr
  ];

  programs.dconf = {
    enable = true;
  };

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        desiredgov = "performance";
      };
    };
  };
}
