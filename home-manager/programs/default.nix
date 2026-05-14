{
  imports = [
    ./xdg/xdgUserDirs.nix
    ./xdg/xdgDesktopPortals.nix

    ./window-managers/mangowm.nix
    ./fontconfig.nix
    
    ./gui/firefox.nix

    ./tui/git.nix
    ./tui/gpg.nix
    ./tui/fish.nix
    ./tui/openssh.nix
    ./tui/helix.nix

    ./ui/waybar.nix
    ./ui/rofi.nix

    ./essentials/foot.nix
  ];
}
