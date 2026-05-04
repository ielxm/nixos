{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helix
    tree
    htop
    yazi
    fastfetch
  ];
  programs.dconf.enable = true;
}
