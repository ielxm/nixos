{ config, pkgs, ... }:
let
  wallpaperPath  = "$HOME/pictures/placeholder.png";
in {
  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;
    systemd.xdgAutostart = false;
    settings = let
      font = "JetBrainsMono Nerd Font Mono"; # Load 1st font from List.
      modKey = "SUPER";
      terminal = "foot";
      menu = "${pkgs.rofi}/bin/rofi -show drun";
    in {
      xkb_rules_layout = "us,ru";
      xkb_rules_options = "grp:alt_shift_toggle";
      borderpx = 2;
      focus_on_activate = 0;
      gappoh = 4;
      gappov = 4;

      animations = 0;
      animation_duration_move = 250;
      animation_duration_open = 200;
      animation_duration_tag = 300;
      animation_duration_close = 200;
      animation_duration_focus = 0;
      animation_fade_in = 0;
      animation_fade_out = 0;

      syncobj_enable = 1;

      enable_hotarea = 0;
      
      no_border_when_single = 1;
      smartgaps = 1;
      new_is_master = 1;
      
      exec-once = [
        "${pkgs.swaybg}/bin/swaybg -i \"${wallpaperPath}\" -o DP-1"
        "${pkgs.waybar}/bin/waybar"
      ];
      monitorrule = [
        "name:^DP-2,width:1920,height:1080,refresh:240,x:0,y:0,vrr:0"
        "name:^HDMI-A-1,width:1920,height:1080,refresh:240,x:0,y:0,vrr:0"
        "name:^DP-1,width:3440,height:1440,refresh:165,x:1920,y:0,scale:1.5,vrr:0"
        "name:^eDP-1,width:1920,height:1080,refresh:144,scale:1.3,vrr:0"
      ];
      mousebind = [
        "${modKey},btn_left,moveresize,curmove"
        "${modKey},btn_right,moveresize,curresize"
      ];
      bind = [
        "${modKey}+SHIFT,r,reload_config"
        "${modKey},w,killclient"
        "${modKey},space,togglefloating"
        "${modKey}+SHIFT,f,togglefullscreen"
        "${modKey}+SHIFT,c,quit"
        "${modKey},tab,zoom"
        "${modKey},q,focusstack,prev"
        "${modKey},e,focusstack,next"
        "${modKey}+SHIFT,q,setmfact,-0.02"
        "${modKey}+SHIFT,e,setmfact,+0.02"

        "${modKey}+SHIFT,tab,toggleoverview,1"

        "${modKey},return,spawn,${terminal}"
        "${modKey},r,spawn,${menu}"
        "${modKey},f,spawn,firefox"
        "${modKey},x,spawn,Telegram"
        "${modKey},c,spawn,element-desktop"
        "${modKey}+SHIFT,x,spawn,discord"
        "${modKey},s,spawn,${terminal} yazi"
        "${modKey},o,spawn,${terminal} htop"

        "NONE,print,spawn_shell,grim -t png - | wl-copy -t image/png"
        "${modKey}+SHIFT,s,spawn_shell,grim -t png -g \"$(slurp)\" - | wl-copy -t image/png"

        "${modKey},d,toggle_scratchpad"
        "${modKey}+SHIFT,d,minimized"

        "${modKey}+SHIFT,1,tagsilent,1"
        "${modKey}+SHIFT,2,tagsilent,2"
        "${modKey}+SHIFT,3,tagsilent,3"
        "${modKey}+SHIFT,4,tagsilent,4"
        "${modKey}+SHIFT,5,tagsilent,5"
        "${modKey}+SHIFT,6,tagsilent,6"
        "${modKey}+SHIFT,7,tagsilent,7"
        "${modKey}+SHIFT,8,tagsilent,8"
        "${modKey}+SHIFT,9,tagsilent,9"
        "${modKey}+SHIFT,0,tagsilent,10"
        "${modKey},1,view,1"
        "${modKey},2,view,2"
        "${modKey},3,view,3"
        "${modKey},4,view,4"
        "${modKey},5,view,5"
        "${modKey},6,view,6"
        "${modKey},7,view,7"
        "${modKey},8,view,8"
        "${modKey},9,view,9"
        "${modKey},0,view,10"
      ];
    };
  };
}
