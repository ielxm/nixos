{
  programs.dconf = {
    enable = true;
  };

  programs.virt-manager = {
    enable = true;
  };

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        desiredgov = "performance";
      };
    };
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  # Steam скачивается на уровне системы потому что:
  # 1. В таком случае он располагает дополнительными опциями
  # 2. В теории, это должно уменьшить количество *возможных* проблем с драйверами, сетью и т.д.
  # 3. Т.к. и без того на уровне системы *уже устанавливаются* gamescope и gamemode
  programs.steam = {
    enable = true;
  };
}
