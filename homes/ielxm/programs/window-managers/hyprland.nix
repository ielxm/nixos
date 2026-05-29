{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      decoration = {
        shadow_offset = "0 5";
        "col.shadow" = "rgba(00000099)";
      };

      "$mod" = "SUPER";
      "$browser" = "firefox";
      "$terminal" = "foot";

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod, F, exec, $browser"
        "$mod, X, exec, Telegram"
        "$mod, A, exec, obsidian"
        "$mod, C, exec, element-desktop"
        "$mod, M, exec, mullvad-vpn"
        "$mod SHIFT, x, exec, discord"
        "$mod SHIFT, A, exec, steam"

        "$mod, W, killactive"
        "$mod SHIFT, C, exit"
        "$mod, SPACE, togglefloating"
        "$mod SHIFT, F, fullscreen"

        "$mod, TAB, layoutmsg, swapwithmaster auto"
        "$mod, Q, layoutmsg, cycleprev"
        "$mod, E, layoutmsg, cyclenext"
        "$mod, Q, layoutmsg, move -col"
        "$mod, E, layoutmsg, move +col"
        "$mod SHIFT, Q, layoutmsg, mfact -0.02"
        "$mod SHIFT, E, layoutmsg, mfact +0.02"
        "$mod CTRL, W, resizeactive, 0 -40"
        "$mod CTRL, S, resizeactive, 0 40"
        "$mod CTRL, P, pin"

        "$mod, D, togglespecialworkspace, magic"
        "$mod SHIFT, D, movetoworkspacesilent, special:magic"
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 9
      ));
    };
  };
}
