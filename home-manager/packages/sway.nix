{ config, pkgs, lib, ... }:
let
  font = builtins.head config.maid.fonts.monospace; # Load 1st font from List.
in {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      menu = "bemenu-run -H 23 -b -i --fn '${font} 11.0' --fb '#000000' --hb '#000000' --tb '#000000'";
      bindkeysToCode = true;

      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
        menu = config.wayland.windowManager.sway.config.menu;
        terminal = config.wayland.windowManager.sway.config.terminal;
      in {
        "${modifier}+Return" = "exec ${terminal}";

        "${modifier}+s" = "exec ${terminal} yazi";
        "${modifier}+o" = "exec ${terminal} htop";
        "${modifier}+r" = "exec ${menu}";
        "${modifier}+f" = "exec firefox";
        "${modifier}+c" = "exec element-desktop";
        "${modifier}+x" = "exec Telegram";
        "${modifier}+Shift+x" = "exec discord";

        "${modifier}+Shift+s" = "exec grim -t png -g $(slurp) - | wl-copy --type image/png";

        "${modifier}+q" = "focus left";
        "${modifier}+e" = "focus right";

        "${modifier}+Shift+r" = "reload";
        "${modifier}+Shift+c" = "exec swaynag -m 'Do you want to kill current Sway session? [Y/n]' -B 'yes' 'swaymsg exit'";
        "${modifier}+w" = "kill";
        "${modifier}+Space" = "floating toggle";

        "${modifier}+d" = "scratchpad show";
        "${modifier}+Shift+d" = "move scratchpad";

        "${modifier}+1" = "workspace 1";
        "${modifier}+2" = "workspace 2";
        "${modifier}+3" = "workspace 3";
        "${modifier}+4" = "workspace 4";
        "${modifier}+5" = "workspace 5";
        "${modifier}+6" = "workspace 6";
        "${modifier}+7" = "workspace 7";
        "${modifier}+8" = "workspace 8";
        "${modifier}+9" = "workspace 9";
        "${modifier}+0" = "workspace 10";

        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";
      };

      modes = {
        
      };
      focus = {
        wrapping = "workspace";
      };
      window = {
        titlebar = false;
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
        command = "waybar";
      }];
      output = {
        ${config.maid.monitors.mainMonitor.genericName} = {
          mode = "${config.maid.monitors.mainMonitor.resolution}@${config.maid.monitors.mainMonitor.refreshRate}Hz";
          scale = "${config.maid.monitors.mainMonitor.scaleFactor}";
          pos = "0,0";
        };
        ${config.maid.monitors.secondMonitor.genericName} = {
          mode = "${config.maid.monitors.secondMonitor.resolution}@${config.maid.monitors.secondMonitor.refreshRate}Hz";
          scale = "${config.maid.monitors.secondMonitor.scaleFactor}";
        };
      };
    };
    extraConfig = ''
      workspace 1 output ${config.maid.monitors.mainMonitor.genericName}
      workspace 2 output ${config.maid.monitors.mainMonitor.genericName} 
      workspace 3 output ${config.maid.monitors.mainMonitor.genericName}
      workspace 4 output ${config.maid.monitors.mainMonitor.genericName}
      workspace 5 output ${config.maid.monitors.mainMonitor.genericName}
      workspace 6 output ${config.maid.monitors.mainMonitor.genericName}
      workspace 7 output ${config.maid.monitors.mainMonitor.genericName}
      workspace 8 output ${config.maid.monitors.mainMonitor.genericName}
      workspace 9 output ${config.maid.monitors.mainMonitor.genericName}
      workspace 10 output ${config.maid.monitors.mainMonitor.genericName}
      workspace 11 output ${config.maid.monitors.secondMonitor.genericName}
      workspace 12 output ${config.maid.monitors.secondMonitor.genericName}
      workspace 13 output ${config.maid.monitors.secondMonitor.genericName}

      include /etc/sway/config.d/*
    '';
    extraOptions = [
      "--unsupported-gpu"
    ];
  };
}
