{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
    xdgOpenUsePortal = true;
    config = {
      mango = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.Secret"       = [ "gnome-keyring" ];
        "org.freedesktop.impl.portal.FileChooser"  = [ "gtk" ];
        "org.freedesktop.impl.portal.Screenshot"   = [ "wlr" ];
        "org.freedesktop.impl.portal.ScreenCast"   = [ "wlr" ];
        "org.freedesktop.impl.portal.Inhibit"      = [ "none" ];
      };
    };
  };
}
