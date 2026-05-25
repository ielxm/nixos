{ ndsl, ... }:
{
  home.username = "root";
  home.homeDirectory = "/root";

  imports = [
    ../../programs/tui/helix.nix
    ../../programs/tui/git.nix
    ../../programs/tui/openssh.nix
    ../../programs/tui/bash.nix
  ];

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
