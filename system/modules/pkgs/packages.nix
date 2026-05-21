{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tree
    htop
    yazi
  ];
}
