{ pkgs, ... }:
let
  iconTheme = "Adwaita";
  iconThemePkg = "adwaita-icon-theme";
in {
  gtk = {
    enable = true;

    iconTheme = {
      package     = pkgs.${iconThemePkg};
      name        = iconTheme;
    };
  };
}
