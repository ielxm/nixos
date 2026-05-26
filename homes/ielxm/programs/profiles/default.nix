{
  imports=[
    ./firefox.nix
    ./foot.nix
    ./mullvad-vpn.nix
    ./rofi.nix
    ./waybar.nix
    ./vscode.nix
    #./obsidian.nix # temporary disabled
    ./xdg-desktop-portals.nix
    ./xdg-user-dirs.nix

    # tui
    ./tui/fastfetch.nix
    ./tui/fish.nix
    ./tui/bash.nix
    ./tui/git.nix
    ./tui/gpg.nix
    ./tui/helix.nix
    ./tui/openssh.nix

    # theming
    ./theming/fontconfig.nix
    ./theming/gtk.nix
    ./theming/icons.nix
    ./theming/qt.nix
  ];
}
