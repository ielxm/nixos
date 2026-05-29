{ ndsl, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = ndsl.appearance.fonts.sansSerif.names;
      sansSerif = ndsl.appearance.fonts.sansSerif.names;
      monospace = ndsl.appearance.fonts.monospace.names;
    };
  };
}
