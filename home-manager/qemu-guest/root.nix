{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "root";
  home.homeDirectory = "/root";

  home.file.".ssh/authorized_keys".text = ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAf6wRDrKuCdTl4tsl36EiayXTmmTgSAbUVcZ1xN1U9v ielxm@nixos
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK8sKRLFw6ykHKTwEidJ2GIYmYz2LmuetnBeaXPqZWtK ielxm@nixos
  '';

  #home.packages = with pkgs; [
  #  kitty
  #  mako
  #  bemenu   
  #  firefox
  #];

  #xdg.portal = {
  #  enable = true;
  #  extraPortals = with pkgs; [
  #    xdg-desktop-portal-gtk
  #  ];
  #  config = {
  #    sway = {
  #      default = [ "gtk" ];
  #    };
  #  };
  #};

  #wayland.windowManager.sway = {
  #  enable = true;
  #  wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
  #};

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      addKeysToAgent = "true";
    };
  };

  programs.git = {
    enable = true;
    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    settings = {
      gpg = {
        format = "ssh";
      };
      user = {
        name = "ielxm";
        email = "git@ielxm.su";
      };
    };
  };


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
