{ ndsl, ... }:
let
  iconTheme = "Adwaita";
  iconThemePkg = "adwaita-icon-theme";
in {
  gtk = {
    enable = true;

    iconTheme = {

      package = ndsl.appearance.themes.icons.package;
      name = ndsl.appearance.themes.icons.name;
    };
  };
}
