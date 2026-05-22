{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tree
    htop
    yazi
    nixd
  ];
  imports = [
    ./display-manager.nix
    ./gnome-dconf.nix
    ./gnome-keyring.nix
    ./mullvad-vpn.nix
    ./pipewire.nix
  ];
}
