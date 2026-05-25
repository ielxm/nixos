{ config, ... }:
let
  homedir=config.home.homeDirectory;
in {
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop       = "${homedir}/.desktop";
    publicShare   = "${homedir}/.public";
    templates     = "${homedir}/.templates";
    documents     = "${homedir}/notes";
    download      = "${homedir}/downloads";
    music         = "${homedir}/music";
    videos        = "${homedir}/videos";
    pictures      = "${homedir}/pictures";
  };
}
