{ config, pkgs, inputs, ndsl, ... }:
{

  imports = [
    ./packages/default.nix
    ./programs/default.nix    
  ];

  home.username = "ielxm";
  home.homeDirectory = "/home/ielxm";

  home.sessionVariables = {
    QT_QPA_PLATFORM = "Wayland";
    QT_QPA_PLATFORMTHEME = "xdgdesktopportal";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    SDL_VIDEODRIVER = "wayland";
  };


  # Workaround to make Element and other Electron applications use GNOME Keyring
  # https://discourse.nixos.org/t/element-desktop-no-longer-working-with-nixos-25-05-on-a-minimal-desktop-i3-or-xterm-due-to-unsupported-keyring/69731/3
  home.file."${config.xdg.configHome}/electron-flags.conf".text = ''
    --password-store=gnome-libsecret
    --ozone-platform=wayland
    --gtk-version=4
    --enable-features=WaylandWindowDecorations,AllowQt
  '';
  home.file."${config.home.homeDirectory}/.scripts/firefox-novpn.sh" = {
    force=true;executable=true;text=''
      #!/bin/sh
      mullvad-exclude firefox --new-instance -no-remote --profile "${config.home.homeDirectory}/.mozilla/firefox/novpn"
    '';
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
