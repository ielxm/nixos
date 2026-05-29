{ home, pkgs, ... }:
{
  imports = [
    ./parts/fonts.nix
    ./common.nix
  ];
  home.packages = with pkgs; [
    xdg-utils # xdg-open (for element-desktop)

    discord

    grim
    slurp
    wl-clipboard
    swaybg

    obsidian
    obs-studio
    telegram-desktop
    element-desktop
  ];
}
