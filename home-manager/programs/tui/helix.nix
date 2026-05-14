{
  programs.helix = {
    enable = true;
    themes.custom = {
      inherits = "carbon";
      "ui.background" = { };
    };
    settings = {
      theme = "custom";
      editor.soft-wrap.enable = true;
    };
  };
}
