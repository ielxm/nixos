{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tree
    htop
  ];
  imports = [
    ./display-manager.nix
    ./gnome-dconf.nix
    ./gnome-keyring.nix
    ./mullvad-vpn.nix
    ./pipewire.nix
    ./gvfs.nix
  ];
}
