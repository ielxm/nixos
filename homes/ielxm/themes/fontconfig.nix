{ ndsl, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif     = ndsl.appearance.fonts.sansSerif.names;
      sansSerif = ndsl.appearance.fonts.sansSerif.names;
      monospace = ndsl.appearance.fonts.monospace.names;
    };
  };
  # Установить все объявленные шрифты
  home.packages =
    ndsl.appearance.fonts.serif.packages
    ++ndsl.appearance.fonts.sansSerif.packages
    ++ndsl.appearance.fonts.monospace.packages ;
}
