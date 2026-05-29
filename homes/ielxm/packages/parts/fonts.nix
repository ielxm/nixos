{ ndsl, ... }:
{
  home.packages =
    ndsl.appearance.fonts.serif.packages
    ++ ndsl.appearance.fonts.sansSerif.packages
    ++ ndsl.appearance.fonts.monospace.packages;
}
