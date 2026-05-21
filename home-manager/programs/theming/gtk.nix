{ ndsl, ... }:
{
  gtk = {
    enable = true;

    iconTheme = {

      package = ndsl.appearance.themes.icons.package;
      name = ndsl.appearance.themes.icons.name;
    };
  };
}
