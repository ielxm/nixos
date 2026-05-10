{
  programs.bash = {
    enable = true;
    shellAliases = {
      ls   = "ls --color=auto";
      ip   = "ip --color=auto";
      grep = "grep --color=auto";
      ssh  = "TERM=xterm-256color ssh";
    };
  };
}
