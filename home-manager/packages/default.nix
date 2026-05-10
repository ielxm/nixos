{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Fonts.
    nerd-fonts.adwaita-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    noto-fonts
    dejavu_fonts

    gcr # GNOME Keyring, provides org.gnome.keyring.SystemPrompter
    xdg-utils # xdg-open (for element-desktop)
    fastfetch

    # Wayland and related utils.
    grim
    slurp
    wl-clipboard
    bemenu
  
    # Proprietary.
    obsidian
    discord

    # FOSS.
    obs-studio
    mullvad-vpn
    telegram-desktop
    element-desktop
  ];
}
