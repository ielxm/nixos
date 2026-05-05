{ pkgs, ... }:

{
  users.users.ielxm = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" ];
    packages = with pkgs; [];
  };
}
