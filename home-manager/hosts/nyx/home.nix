{ config, pkgs, inputs, ndsl, ... }:
{

  imports = [
    inputs.mangowm.hmModules.mango

    ../../programs/firefox.nix
    ../../programs/foot.nix
    ../../programs/xdg-user-dirs.nix
    ../../programs/xdg-desktop-portals.nix
    ../../programs/rofi.nix
    ../../programs/mullvad-vpn.nix
    ../../programs/waybar.nix
    ../../programs/window-managers/mangowm.nix
    ../../programs/tui/git.nix
    ../../programs/tui/openssh.nix
    ../../programs/tui/fish.nix
    ../../programs/tui/gpg.nix
    ../../programs/tui/helix.nix
    ../../programs/theming/gtk.nix
    ../../programs/theming/qt.nix
    ../../programs/theming/fontconfig.nix
    ../../programs/tui/git.nix
    ../../programs/tui/openssh.nix
    ../../programs/tui/fish.nix
    ../../programs/tui/gpg.nix
    ../../programs/tui/helix.nix
    ../../programs/tui/fastfetch.nix
    ../../programs/theming/gtk.nix
    ../../programs/theming/qt.nix
    ../../programs/theming/fontconfig.nix
    ../../programs/theming/icons.nix
  ];

  home.username = ndsl.primaryUser;
  home.homeDirectory = "/home/${ndsl.primaryUser}";

  home.sessionVariables = {
    QT_QPA_PLATFORM = "Wayland;xcb";
    QT_QPA_PLATFORMTHEME = "xdgdesktopportal";
    SDL_VIDEODRIVER = "wayland";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  home.packages = with pkgs; [
    xdg-utils # xdg-open (for element-desktop)

    obsidian
    discord

    grim
    slurp
    wl-clipboard
    swaybg

    obs-studio
    telegram-desktop
    element-desktop
  ];

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
