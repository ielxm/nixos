{ config, pkgs, inputs, lib, ... }:

{
  options = {

    maid.fonts = lib.mkOption {
      type = lib.types.attrs;
      default = {
        monospace   = [ "Iosevka Nerd Font Mono" ];
        serif       = [ "DejaVu Serif" ];
        sansSerif  = [ "DejaVu Sans" ];
      };
    };

    maid.iconTheme = lib.mkOption {
      type = lib.types.attrs;
      default = {
        name   = "Adwaita";
        pkg    = "adwaita-icon-theme";
      };
    };
  };

  imports = [
    ./sway.nix
    ./firefox.nix
  ];

  config = {

    home.username = "ielxm";
    home.homeDirectory = "/home/ielxm";

    # Workaround to make Element and other Electron applications use GNOME Keyring
    # https://discourse.nixos.org/t/element-desktop-no-longer-working-with-nixos-25-05-on-a-minimal-desktop-i3-or-xterm-due-to-unsupported-keyring/69731/3
    home.file."${config.xdg.configHome}/electron-flags.conf".text = ''
      --password-store="gnome-libsecret"
    '';

    home.pointerCursor = {
      package = pkgs.${config.maid.iconTheme.pkg};
      name = config.maid.iconTheme.name;

      x11 = {
        enable = true;
        defaultCursor = config.maid.iconTheme.name;
      };
    };

    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace =   config.maid.fonts.monospace;
        sansSerif =   config.maid.fonts.sansSerif;
        serif     =   config.maid.fonts.serif;
      };
    };

    home.packages = with pkgs; [
      # Fonts.
      nerd-fonts.adwaita-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      noto-fonts
      dejavu_fonts

      gcr # GNOME Keyring, provides org.gnome.keyring.SystemPrompter
      xdg-utils # xdg-open (for element-desktop)

      fastfetch

      # Wayland and related utils.
      grim
      slurp
      wl-clipboard

      # Gaming.
      gamescope
      steam

      # Proprietary.
      obsidian
      discord

      # FOSS.
      obs-studio
      mullvad-vpn
      telegram-desktop
      element-desktop
    ];

    programs.i3status = {
      enable = true;
    };

    programs.kitty = {
      enable = true;
      font = {
        name = builtins.head config.maid.fonts.monospace; # Load 1st font from List.
        size = 13.0;
      };
      settings = {
        confirm_os_window_close = 0;
        enable_audio_bell = false;
      };
    };

    programs.gpg = {
      enable = true;
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
        key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
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

    programs.helix = {
      enable = true;
      settings = {
        theme = "vim_dark_high_contrast";
        editor.soft-wrap.enable = true;
      };
    };

    #services.gnome-keyring = {
    #  enable = true;
    #};

    gtk = {
      enable = true;

      iconTheme = {
        package = pkgs.${config.maid.iconTheme.pkg};
        name = config.maid.iconTheme.name;
      };
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
      xdgOpenUsePortal = true;
      config = {
        sway = {
          default = [ "wlr" ];
          "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];

          "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
          "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
        };
      };
    };

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    
      desktop = "${config.home.homeDirectory}/.desktop";
      publicShare = "${config.home.homeDirectory}/.public";
      templates = "${config.home.homeDirectory}/.templates";
      documents = "${config.home.homeDirectory}/notes";
      download = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/music";
      videos = "${config.home.homeDirectory}/videos";
      pictures = "${config.home.homeDirectory}/pictures";
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
  };
}
