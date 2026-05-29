{ ndsl, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = builtins.head ndsl.appearance.fonts.monospace.names;
      };
      colors = {
        background = "#000000D9";
        border = "#285577FF";
        text = "#56585CFF";
        match = "#E33452FF";
        selection = "#383A57B3";
        selection-text = "#CFD3E6FF";
        selection-match = "#C7102FFF";
        input = "#90949BFF";
        prompt = "#B6B8BAFF";
      };
      border = {
        width = 1;
        radius = 0;
      };
    };
  };
}
