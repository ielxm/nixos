{ ndsl, ... }:
{
  programs.waybar = {
    enable = true;
    settings.main = {
      layer = "bottom";
      position = "bottom";
      height = 21;
      reload_style_on_change = true;
      enable-bar-scroll = false;
      output = [ "DP-2" "eDP-1" ];
      modules-left = [ "ext/workspaces" "dwl/window" ];
      modules-right = [ "network#wifi" "custom/separator" "network#ipv4" "custom/separator" "bluetooth" "custom/separator" "wireplumber" "custom/separator" "memory" "custom/separator" "clock" "custom/separator" "tray" ];

      "ext/workspaces" = {
        ignore-hidden = true;
        on-click = "activate";
        sort-by-id = true;
      };
      "dwl/window" = {
        max-length = 600;
        tooltip = false;
      };
      "clock" = {
        interval = 5;
        format = "{:%Y-%m-%d %H:%M:%OS}";
        tooltip = false;
      };
      "memory" = {
        interval = 10;
        format = "{avail:<4.1f} GiB";
        tooltip = false;
      };
      "wireplumber" = {
        format = "VOL: {volume}";
        format-muted = "VOL: muted";
        scroll-step = 1.0;
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        tooltip = false;
      };
      "bluetooth" = {
        format = "BT: N/A";
        format-off = "BT: off";
        format-disabled = "BT: down";
        format-connected = "BT: {device_address}";
        format-no-controller = "BT: N/A";
      };
      "network#ipv4" = {
        interval = 10;
        family = "ipv4";
        format = "N: N/A";
        format-ethernet = "E: {ipaddr}";
        format-disconnected = "N: N/A";
        format-disabled = "N: down";
        format-wifi = "W: {ipaddr}";
        tooltip = false;
      };
      "network#ipv6" = {
        interval = 10;
        family = "ipv6";
        format = "{ipaddr}";
        tooltip = false;
      };
      "network#wifi" = {
        interval = 10;
        family = "ipv4";
        format = "W: down";
        format-wifi = "W: {ipaddr}";
        tooltip = false;
      };
      "custom/separator" = {
        format = "|";
        interval = "once";
        tooltip = false;
      };
    };
    style = let
      fonts = builtins.concatStringsSep ", " ndsl.appearance.fonts.monospace.names;
      color.background = "#000000";
      color.foreground = "#FFFFFF";
      color.foreground_workspaces_button = "#A2A6AB";
      color.foreground_separator = "#ADABB0";
      color.foreground_network = "#00FF00";
      color.foreground_network_wifi = "#FF0000";
    in ''
      *
      {
        font-family: ${fonts};
        font-weight: bold;
        font-size: 12.0px;
      }
      window
      {
        border: none;
        border-radius: 0px;
        color: ${color.foreground};
      }
      window#waybar
      {
        background: ${color.background};
      }
      #window
      {
        margin: 0 4px;
      }
      #workspaces,
      #tags
      {
        margin: 0 0px;
      }
      #workspaces button
      {
        padding: 1px;
        margin: 0px;
        color: ${color.foreground_workspaces_button};
        border: none;
      }
      #workspaces button:hover
      {
        background: none;
        box-shadow: inherit;
        text-shadow: inherit;
      }
      #workspaces button.visible,
      #workspaces button.active
      {
        color: ${color.foreground};
      }
      #network
      {
        color: ${color.foreground_network};
      }
      #network.wifi
      {
        color: ${color.foreground_network_wifi};
      }
      #tray menu
      {
        background: ${color.background};
        color: ${color.foreground};
        padding: 1px;
      }
      #custom-separator
      {
        margin: 0 4px;
        color: ${color.foreground_separator};
      }
    '';
  };
}
