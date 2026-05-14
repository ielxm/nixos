{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    settings.main = {
      font = "JetBrainsMono Nerd Font Mono:size=12.0";
      dpi-aware = "yes";
      term = "xterm-256color";
      shell = "fish";
    };
  };
}
