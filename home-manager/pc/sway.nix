{ lib, pkgs, config, home, ... }:
let
  profileDirectory = config.home.profileDirectory;
in {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      #menu = "${pkgs.bemenu}/bin/bemenu-run -H 23 -b -i"; # height 22, bottom, ignorecase
      menu = "${pkgs.fuzzel}/bin/fuzzel";

      modes = lib.mkForce{};
      bindkeysToCode = true;
      keybindings = lib.mkForce {

      };
      
      focus = {
        wrapping = "workspace";
      };

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
        names = config.maid.fonts.monospace;
        size = 10.0;
      };
      bars = [{
        fonts = {
          names = config.maid.fonts.monospace;
          size = 10.0;
        };
        statusCommand = "${profileDirectory}/bin/i3status";
        extraConfig = ''
          icon_theme ${config.maid.iconTheme.name}
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
      bindsym --to-code ${modifier}+Shift+c exec swaynag -m "Do you want to kill current Sway session? [Y/n]" -B "Yes" "swaymsg exit"
      bindsym --to-code ${modifier}+r exec ${menu}
      bindsym --to-code ${modifier}+f exec firefox #${config.programs.firefox.finalPackage}/bin/firefox
      bindsym --to-code ${modifier}+x exec Telegram
      bindsym --to-code ${modifier}+c exec element-desktop
      bindsym --to-code ${modifier}+s exec yazi
      bindsym --to-code ${modifier}+o exec htop
      bindsym --to-code ${modifier}+Shift+s exec grim -t png -g "$(slurp)" - | wl-copy --type image/png
      
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
}
