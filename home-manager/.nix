{ config, ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = "${config.home.homeDirectory}/.desktop";
    publicShare = "${config.home.homeDirectory}/.public";
    templates = "${config.home.homeDirectory}/.templates";
    documents = "${config.home.homeDirectory}/notes";
    download = "${config.home.homeDirectory}/downloads";
    music = "${config.home.homeDirectory}/music";
    videos = "${config.home.homeDirectory}/videos";
    pictures = "${config.home.homeDirectory}/pictures";
  };
}
