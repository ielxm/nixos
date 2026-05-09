{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tree
    htop
    yazi
  ];

  programs.dconf.enable = true;
  programs.gamemode.enable = true;
}
