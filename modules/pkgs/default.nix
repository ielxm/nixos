{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tree
    htop
    yazi
  ];
  imports = [
    ./display-manager.nix
    ./gnome-dconf.nix
    ./gnome-keyring.nix
    ./mullvad-vpn.nix
    ./pipewire.nix
  ];
}
