{

  services.gnome.gnome-keyring.enable = true;

  # Enable the Pipewire daemon.
  services.pipewire = {
    enable = true;
    pulse.enable = true; # pipewire-pulse
  };
  
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };
}
