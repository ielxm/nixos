{ config, ... }:
{
  services.greetd = {
    enable = true;
    settings = rec {
      default_session = initial_session;
      initial_session = {
        command = "mango";
        user = config.ndsl.primaryUser;
      };
    };
  };
  security.pam.services.greetd.enableGnomeKeyring = true;
}
