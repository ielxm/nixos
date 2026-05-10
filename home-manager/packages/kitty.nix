{ config, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = builtins.head config.maid.fonts.monospace; # Load 1st font from List.
      size = 12.0;
    };
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      cursor_shape = "beam";
      cursor_shape_unfocused = "hollow";
      window_padding_width = 0;
      window_margin_width = 0;
    };
  };
}
