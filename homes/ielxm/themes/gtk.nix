{ ndsl, ... }:
{
  gtk = {
    enable = true;

    iconTheme = {
      package = ndsl.appearance.themes.icons.package;
      name = ndsl.appearance.themes.icons.name;
    };
  };

  home.pointerCursor = {
    package = ndsl.appearance.themes.icons.package;
    name = ndsl.appearance.themes.icons.name;
    x11 = {
      enable = true;
      defaultCursor = ndsl.appearance.themes.icons.name;
    };
  };
}
