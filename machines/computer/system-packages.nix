{ pkgs, ... }:

{

  # You can't set GTK themes using Home Manager without that option
  programs.dconf.enable = true;
 
  environment.systemPackages = with pkgs; [
    helix
    tree
    htop
    yazi
    fastfetch
  ];
}
