{ config, ... }:
{
  programs.git = {
    enable = true;
    signing = {
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    settings = {
      gpg = {
        format = "ssh";
      };
      user = {
        name = "ielxm";
        email = "ielxm@proton.me";
      };
    };
  };
}
