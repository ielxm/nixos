{
  services.gnome.gnome-keyring.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true; # pipewire-pulse
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
