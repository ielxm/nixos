{ home, config, ... }:
{
  home.file."${config.home.homeDirectory}/.scripts/firefox-novpn.sh" = {
    force=true;executable=true;text=''
      #!/bin/sh
      mullvad-exclude firefox --new-instance -no-remote --profile "${config.home.homeDirectory}/.mozilla/firefox/novpn"
    '';
  };
}
