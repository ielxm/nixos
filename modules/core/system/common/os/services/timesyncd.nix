{
  time = {
    timeZone = "Europe/Moscow";
    hardwareClockInLocalTime = false;
  };

  services = {
    chrony.enable = false;
    timesyncd = {
      enable = true;
      servers = [
        "0.pool.ntp.org"
        "1.pool.ntp.org"
        "2.pool.ntp.org"
        "3.pool.ntp.org"
      ];
      extraConfig = ''
        PollIntervalMinSec=128
      '';
    };
  };
}
