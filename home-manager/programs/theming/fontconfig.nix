let
  monospace = [ "JetBrainsMono Nerd Font Mono" ];
  sansSerif = [ "DejaVu Sans" "Noto Sans" ];
  serif =     [ "DejaVu Serif" "Noto Serif" ];
in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = monospace;
      sansSerif = sansSerif;
      serif     = serif;
    };
  };
}
