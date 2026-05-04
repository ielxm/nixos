{ pkgs, ... }:

{
  users.users.ielxm = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [];
  };
}
