{ pkgs, ... }:
{
  services.dbus.packages = with pkgs; [
    gnome-keyring
    gcr
  ];

  services.gnome.gnome-keyring.enable = true;

  services.mullvad-vpn = {
    enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = rec {
      default_session = initial_session;
      initial_session = {
        command = "mango";
        user = "ielxm";
      };
    };
  };
}
