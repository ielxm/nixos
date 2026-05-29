{
  programs.bash = {
    enable = true;
    initExtra = ''
      if [ "$EUID" -ne 0 ]; then
        USER_COLOR="\[\e[0;33m\]"
        CDIR_COLOR="\[\e[0;32m\]"
      else
        USER_COLOR="\[\e[0;31m\]"
        CDIR_COLOR="\[\e[0;31m\]"
      fi

      HOSTNAME_COLOR="\[\e[0;35m\]"

      PS1="$USER_COLOR\u\[\e[0m\] at $HOSTNAME_COLOR\h\[\e[0m\] in $CDIR_COLOR\w\[\e[0m\]\n↪ "

    '';
  };
}
