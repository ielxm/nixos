{ pkgs, ... }:
{
  users.users.= {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "libvirtd"
      "video"
      #"audio"
      #"input"
    ];
  };
}
