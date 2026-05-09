{ config, pkgs, inputs, lib, ... }:

let
  fonts_monospaced =  [ "AdwaitaMono Nerd Font Mono" ];
  fonts_sans_serif =  [ "DejaVu Sans" "Noto Sans" ];
  fonts_serif      =  [ "DejaVu Serif" "Noto Serif" ];

  gtk_theme = "";
  gtk_theme_pkg = "";

  icon_theme = "Adwaita";
  icon_theme_pkg = "adwaita-icon-theme";

  cursor_theme = "Adwaita";

in {
  home.username = "ielxm";
  home.homeDirectory = "/home/ielxm";

  home.pointerCursor = {
    package = pkgs.${icon_theme_pkg};
    name = cursor_theme;

    x11 = {
      enable = true;
      defaultCursor = cursor_theme;
    };
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace =   fonts_monospaced;
      sansSerif =   fonts_sans_serif;
      serif     =   fonts_serif;
    };
  };

  services.gnome-keyring.enable = true;

  programs.helix = {
    enable = true;
    settings = {
      theme = "vim_dark_high_contrast";
      editor.soft-wrap.enable = true;
    };
  };

  programs.kitty = {
    enable = true;
    font = {
      name = builtins.head fonts_monospaced; # Load 1st font from List.
      size = 13.0;
    };
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
    };
  };

  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];

    policies = {
      AIControls.Default.Value = "blocked";
      BrowserDataBackup = {
        AllowBackup = false;
        AllowRestore = false;
      };
      
      AppAutoUpdate                 = false;
      BackgroundAppUpdate           = false;

      DisablePocket                 = true;
      DisableTelemetry              = true;
      DisableMasterPasswordCreation = true;
      DisableFirefoxScreenshots     = true;
      DisableFirefoxAccounts        = true;
      DisableFirefoxStudies         = true;
      DisableProfileImport          = true;
      DisableSetDesktopBackground   = true;
      DisableFeedbackCommands       = true;
      DisableForgetButton           = true;

      OfferToSaveLogins             = false;
      HardwareAcceleration          = true;
      DontCheckDefaultBrowser       = true;
      PromptForDownloadLocation     = true;
      CaptivePortal                 = false;
      GenerativeAI.Enabled          = false;
            
      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "*".installation_mode = "blocked";

        "uBlock0@raymondhill.net" = {
          install_url       = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled  = true;
        };
      };
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
    bemenu

    # Gaming.
    gamescope
    steam

    # Proprietary.
    obsidian
    #discord

    # FOSS.
    obs-studio
    mullvad-vpn
    telegram-desktop
    element-desktop
  ];

  programs.i3status = {
    enable = true;
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

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.${icon_theme_pkg};
      name = icon_theme;
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

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = {
      modifier = "Mod4";
      terminal = "${pkgs.kitty}/bin/kitty";
      menu = "${pkgs.bemenu}/bin/bemenu-run -b -H 22";

      modes = lib.mkForce{};
      bindkeysToCode = true;
      keybindings = lib.mkForce {

      };
      
      focus.wrapping = "workspace";
        

      window = {
        titlebar = true;
      };

      input = {
        "*" = {
          xkb_layout = "us,ru";
          xkb_options = "grp:alt_shift_toggle";
        };
      };
      fonts = {
        names = fonts_monospaced;
        size = 9.0;
      };
      bars = [{
        fonts = {
          names = fonts_monospaced;
          size = 9.0;
        };
        statusCommand = "${pkgs.i3status}/bin/i3status";
        extraConfig = ''
          icon_theme ${icon_theme}
        '';
      }];
      output = {
        DP-1 = {
          mode = "3440x1440@165Hz";
          scale = "1.35";
        };
        DP-2 = {
          mode = "1920x1080@240Hz";
          pos = "0,0";
        };
      };
    };
    extraConfig = let
        modifier = config.wayland.windowManager.sway.config.modifier;
        menu = config.wayland.windowManager.sway.config.menu;
        terminal = config.wayland.windowManager.sway.config.terminal;

        mainMonitor = "DP-2";
        secondMonitor = "DP-1";
    in ''
      # TODO: Move all binds to sway.config.keybindings {}
      # 
      bindsym --to-code ${modifier}+Return exec ${terminal}
      bindsym --to-code ${modifier}+w kill
      bindsym --to-code ${modifier}+Shift+r reload
      bindsym --to-code ${modifier}+Shift+c exec ${pkgs.sway}/bin/swaynag -m "Do you want to kill current Sway session? [Y/n]" -B "Yes" "${pkgs.sway}/bin/swaymsg exit"
      bindsym --to-code ${modifier}+r exec ${menu}
      bindsym --to-code ${modifier}+f exec firefox #${pkgs.firefox}/bin/firefox
      bindsym --to-code ${modifier}+x exec Telegram #${pkgs.telegram-desktop}/bin/Telegram
      bindsym --to-code ${modifier}+c exec element-desktop #${pkgs.element-desktop}/bin/element-desktop
      bindsym --to-code ${modifier}+s exec ${terminal} yazi # ${pkgs.yazi}/bin/yazi
      bindsym --to-code ${modifier}+o exec ${terminal} htop # ${pkgs.htop}/bin/htop
      bindsym --to-code ${modifier}+Shift+s exec ${pkgs.grim}/bin/grim -t png -g $(${pkgs.slurp}/bin/slurp) - | wl-copy --type image/png

      bindsym --to-code ${modifier}+Space floating toggle

      bindsym --to-code ${modifier}+q focus left
      bindsym --to-code ${modifier}+e focus right

      bindsym --to-code ${modifier}+d scratchpad show
      bindsym --to-code ${modifier}+d+Shift move scratchpad

      bindsym --to-code ${modifier}+1 workspace number 1
      bindsym --to-code ${modifier}+2 workspace number 2
      bindsym --to-code ${modifier}+3 workspace number 3
      bindsym --to-code ${modifier}+4 workspace number 4
      bindsym --to-code ${modifier}+5 workspace number 5
      bindsym --to-code ${modifier}+6 workspace number 6
      bindsym --to-code ${modifier}+7 workspace number 7
      bindsym --to-code ${modifier}+8 workspace number 8
      bindsym --to-code ${modifier}+9 workspace number 9
      bindsym --to-code ${modifier}+0 workspace number 10
      bindsym --to-code ${modifier}+F1 workspace number 11
      bindsym --to-code ${modifier}+F2 workspace number 12
      bindsym --to-code ${modifier}+F3 workspace number 13

      bindsym --to-code ${modifier}+Shift+1 move container to workspace number 1
      bindsym --to-code ${modifier}+Shift+2 move container to workspace number 2
      bindsym --to-code ${modifier}+Shift+3 move container to workspace number 3
      bindsym --to-code ${modifier}+Shift+4 move container to workspace number 4
      bindsym --to-code ${modifier}+Shift+5 move container to workspace number 5
      bindsym --to-code ${modifier}+Shift+6 move container to workspace number 6
      bindsym --to-code ${modifier}+Shift+7 move container to workspace number 7
      bindsym --to-code ${modifier}+Shift+8 move container to workspace number 8
      bindsym --to-code ${modifier}+Shift+9 move container to workspace number 9
      bindsym --to-code ${modifier}+Shift+0 move container to workspace number 10
      bindsym --to-code ${modifier}+Shift+F1 move container to workspace number 11
      bindsym --to-code ${modifier}+Shift+F2 move container to workspace number 12
      bindsym --to-code ${modifier}+Shift+F3 move container to workspace number 13

      workspace 1 output ${mainMonitor}
      workspace 2 output ${mainMonitor} 
      workspace 3 output ${mainMonitor}
      workspace 4 output ${mainMonitor}
      workspace 5 output ${mainMonitor}
      workspace 6 output ${mainMonitor}
      workspace 7 output ${mainMonitor}
      workspace 8 output ${mainMonitor}
      workspace 9 output ${mainMonitor}
      workspace 10 output ${mainMonitor}
      workspace 11 output ${secondMonitor}
      workspace 12 output ${secondMonitor}
      workspace 13 output ${secondMonitor}

      include /etc/sway/config.d/*
    '';
    extraOptions = [
      "--unsupported-gpu"
    ];
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
