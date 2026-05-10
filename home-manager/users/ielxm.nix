{ config, pkgs, inputs, lib, ... }:
{
  options = {

    maid.monitors = lib.mkOption {
      type = lib.types.attrs;
      default = {
        mainMonitor = {
          genericName     = "DP-2";
          scaleFactor     = "1.0";
          resolution      = "1920x1080";
          refreshRate     = "240";
        };
        secondMonitor = {
          genericName     = "DP-1";
          scaleFactor     = "1.335";
          resolution      = "3440x1440";
          refreshRate     = "165";
        };
      };
    };

    maid.fonts = lib.mkOption {
      type = lib.types.attrs;
      default = {
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
        serif     = [ "DejaVu Serif" ];
        sansSerif = [ "DejaVu Sans" ];
      };
    };

    maid.iconTheme = lib.mkOption {
      type = lib.types.attrs;
      default = {
        name   = "Adwaita";
        pkg    = "adwaita-icon-theme";
      };
    };
  };

  imports = [
    ../packages/default.nix
    ../packages/ssh.nix
    ../packages/gpg.nix
    ../packages/git.nix
    ../packages/sway.nix
    ../packages/waybar.nix
    ../packages/helix.nix
    ../packages/gnomeKeyring.nix
    ../packages/firefox.nix
    ../packages/kitty.nix
    ../xdg/mimeTypes.nix
    ../xdg/desktopEntries.nix
    ../xdg/desktopPortals.nix
    ../xdg/userDirs.nix
  ];

  config = {

    home.username = "ielxm";
    home.homeDirectory = "/home/ielxm";

    # Workaround to make Element and other Electron applications use GNOME Keyring
    # https://discourse.nixos.org/t/element-desktop-no-longer-working-with-nixos-25-05-on-a-minimal-desktop-i3-or-xterm-due-to-unsupported-keyring/69731/3
    home.file."${config.xdg.configHome}/electron-flags.conf".text = ''
      --password-store="gnome-libsecret"
    '';
    home.pointerCursor = {
      package = pkgs.${config.maid.iconTheme.pkg};
      name = config.maid.iconTheme.name;
      x11 = {
        enable = true;
        defaultCursor = config.maid.iconTheme.name;
      };
    };
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = config.maid.fonts.monospace;
        sansSerif = config.maid.fonts.sansSerif;
        serif     = config.maid.fonts.serif;
      };
    };
    gtk = {
      enable = true;

      iconTheme = {
        package = pkgs.${config.maid.iconTheme.pkg};
        name = config.maid.iconTheme.name;
      };
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
  };
}
