{ pkgs, ... }:

{
  #services.greetd = {
  #  enable = true;
  #  settings = {
  #    default_session = {
  #      command = ""
  #    };
  #  };
  #};

  services.mullvad-vpn = {
    enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true; # pipewire-pulse
    alsa.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.sway}/bin/sway --unsupported-gpu";
        user = "ielxm";
      };
      default_session = initial_session;
    };
  };
  
  #services.openssh = {
  #  enable = true;
  #  ports = [ 22 ];
  #  settings = {
  #    PasswordAuthentication = true;
  #    KbdInteractiveAuthentication = false;
  #    PermitRootLogin = "no";
  #  };
  #};
}
