{ home, ... }:
{
  home.sessionVariables = {
    QT_QPA_PLATFORM = "Wayland";
    QT_QPA_PLATFORMTHEME = "xdgdesktopportal";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    SDL_VIDEODRIVER = "wayland";
  };
}
