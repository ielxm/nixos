{
  imports=[
    # gui
    ./gui/firefox.nix
    ./gui/vscode.nix
    ./gui/mullvad-vpn.nix

    # wayland-essentials
    ./wayland-essentials/foot.nix
    ./wayland-essentials/rofi.nix
    ./wayland-essentials/waybar.nix

    # xdg
    ./xdg/xdg-desktop-portals.nix
    ./xdg/xdg-user-dirs.nix

    # cli
    ./cli/fastfetch.nix
    ./cli/fish.nix
    ./cli/git.nix
    ./cli/gpg.nix
    ./cli/helix.nix
    ./cli/openssh.nix

    # theming
    ./theming/fontconfig.nix
    ./theming/gtk.nix
    ./theming/icons.nix
    ./theming/qt.nix

    ./window-managers/sway.nix
  ];
}
