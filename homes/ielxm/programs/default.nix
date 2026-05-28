{
  imports=[
    # gui
    ./gui/firefox.nix
    ./gui/vscode.nix
    ./gui/mullvad-vpn.nix

    # wayland-essentials
    ./wayland-essentials/terminals/foot.nix
    ./wayland-essentials/app-launchers/fuzzel.nix
    ./wayland-essentials/bars/waybar.nix

    ./shell/fish.nix
    ./shell/bash.nix

    # cli
    ./cli/fastfetch.nix
    ./cli/git.nix
    ./cli/gpg.nix
    ./cli/helix.nix
    ./cli/openssh.nix
    ./cli/yazi.nix

    ./window-managers/sway.nix
  ];
}
