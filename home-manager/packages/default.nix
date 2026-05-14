{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.adwaita-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    noto-fonts
    dejavu_fonts

    xdg-utils # xdg-open (for element-desktop)
    fastfetch

    obsidian
    discord

    grim
    slurp
    wl-clipboard

    obs-studio
    mullvad-vpn
    telegram-desktop
    element-desktop
  ];
}
