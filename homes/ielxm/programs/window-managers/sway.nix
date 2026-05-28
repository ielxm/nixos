{ config, ndsl, lib, ... }:
let
  fonts = ndsl.appearance.fonts.monospace.names;
in {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = {
      modifier = "Mod4";
      terminal = "foot";
      menu="rofi -show drun";
      #menu = "bemenu-run -H 23 -b -i --fn '${font} 11.0' --fb '#000000' --hb '#000000' --tb '#000000'";
      bindkeysToCode = true;

      keybindings = let
        mod = config.wayland.windowManager.sway.config.modifier;
        menu = config.wayland.windowManager.sway.config.menu;
        terminal = config.wayland.windowManager.sway.config.terminal;
      in {
        "${mod}+Return" = "exec ${terminal}";

        "${mod}+s" = "exec ${terminal} yazi";
        "${mod}+o" = "exec ${terminal} htop";
        "${mod}+r" = "exec ${menu}";
        "${mod}+f" = "exec firefox";
        "${mod}+c" = "exec element-desktop";
        "${mod}+x" = "exec Telegram";
        "${mod}+Shift+x" = "exec discord";

        "${mod}+Shift+s" = "exec grim -t png -g $(slurp) - | wl-copy --type image/png";

        "${mod}+q" = "focus left";
        "${mod}+e" = "focus right";

        "${mod}+Shift+r" = "reload";
        "${mod}+Shift+c" = "exec swaynag -m 'Do you want to kill current Sway session? [Y/n]' -B 'yes' 'swaymsg exit'";
        "${mod}+w" = "kill";
        "${mod}+Space" = "floating toggle";

        "${mod}+d" = "scratchpad show";
        "${mod}+Shift+d" = "move scratchpad";

        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+9" = "workspace 9";
        "${mod}+0" = "workspace 10";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";
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
        names = fonts;
        size = 10.0;
      };
      bars = [{
        command = "waybar";
      }];
      output = {};
    };
    extraConfig = ''
      workspace 1 output DP-2
      workspace 2 output DP-2 
      workspace 3 output DP-2
      workspace 4 output DP-2
      workspace 5 output DP-2
      workspace 6 output DP-2
      workspace 7 output DP-2
      workspace 8 output DP-2
      workspace 9 output DP-2
      workspace 10 output DP-2
      workspace 11 output DP-1
      workspace 12 output DP-1
      workspace 13 output DP-1

      include /etc/sway/config.d/*
    '';
    extraOptions = [
      "--unsupported-gpu"
    ];
  };
}
