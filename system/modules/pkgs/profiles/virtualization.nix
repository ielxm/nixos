{ pkgs, ... }:
{
  programs.virt-manager = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    dnsmasq
  ];
}
