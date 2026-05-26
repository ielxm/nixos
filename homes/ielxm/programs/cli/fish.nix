{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_config theme choose coolbeans
      fish_config prompt choose pythonista
    '';
  };
}
