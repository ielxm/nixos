{ config, pkgs, inputs, ... }:

{
  home.username = "ielxm";
  home.homeDirectory = "/home/ielxm";

  home.file.".config/sway" = {
    source = "${inputs.db}/dotfiles/sway";
    force = true;
  };

  home.file.".config/mako" = {
    source = "${inputs.db}/dotfiles/mako";
    force = true;
  };

  home.file.".config/kitty" = {
    source = "${inputs.db}/dotfiles/kitty";
    force = true;
  };

  home.file.".scripts" = {
    source = "${inputs.db}/scripts";
    force = true;
  };

  home.packages = with pkgs; [
    kitty
    mako
    bemenu   
    firefox
    wl-clipboard
    grim
    slurp
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      sway = {
        default = [ "gtk" ];
      };
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
  };

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

  programs.bash = {
    enable = true;
    shellAliases = {
      ls   = "ls --color=auto";
      ip   = "ip --color=auto";
      grep = "grep --color=auto";
      ssh  = "TERM=xterm-256color ssh";
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
