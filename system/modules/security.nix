{
  security = {
    polkit = {
      enable = true;
    };
    pam.services = {
      greetd.enableGnomeKeyring = true;
    };
  };
}
