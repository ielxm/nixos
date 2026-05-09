{ config, pkgs, ... }:

{
  home.username = "root";
  home.homeDirectory = "/root";

  programs.helix = {
    enable = true;
    settings = {
      theme = "vim_dark_high_contrast";
      editor.soft-wrap.enable = true;
    };
  };

  programs.git = {
    enable = true;
    signing = {
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    settings = {
      gpg = {
        format = "ssh";
      };
      user = {
        name = "ielxm";
        email = "git@ielxm.su";
      };
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
}
