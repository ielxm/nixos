{ pkgs, ... }:
{
  services.dbus = {
    packages = with pkgs; [
      gnome-keyring
      gcr
    ];
  };

  services.gnome.gnome-keyring = {
    enable = true;
  };
}
