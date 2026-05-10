{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./kernel.nix
    ./nvidia.nix
    ./network.nix
    ./libvirt.nix
  ];


  security = {
    polkit = {
      enable = true;
    };
    pam = {
      services.greetd.enableGnomeKeyring = true;
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

  services.greetd = {
    enable = true;
    settings = rec {
      default_session = initial_session;
      initial_session = {
        command = "sway --unsupported-gpu";
        user = "ielxm";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    tree
    htop
    yazi
    dnsmasq
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

  programs.virt-manager = {
    enable = true;
  };
}
