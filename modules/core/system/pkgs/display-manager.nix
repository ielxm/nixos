{ config, pkgs, ... }:
{
  # services.greetd = {
  #   enable = true;
  #   settings = rec {
  #     default_session = initial_session;
  #     initial_session = {
  #       command = "mango";
  #       user = config.ndsl.primaryUser;
  #     };
  #   };
  # };
  # security.pam.services.greetd.enableGnomeKeyring = true;

  services.displayManager.sessionPackages = [ config.programs.mango.package ];

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
  
  security.pam.services.gdm.enableGnomeKeyring = true;
  programs.mango.addLoginEntry = true;

  # fuck gdm
  # fuck monitors.xml and its syntax

  # environment.etc."xdg/monitors.xml" = {
  #   mode = "0644";
  #   text = ''
  #     <monitors version="2">
  #       <configuration>
  #         <disabled>
  #           <monitorspec>
  #             <connector>DP-1</connector>
  #             <serial>0xC080F622</serial>
  #           </monitorspec>
  #         </disabled>
  #       </configuration>
  #     </monitors>
  #   '';
  # };

  # systemd.tmpfiles.rules = [
  #   "L+ /var/lib/gdm/seat0/config/monitors.xml - gdm gdm - ${pkgs.writeText "gdm-monitors.xml" ''
  #     <monitors version="2">
  #       <configuration>
  #         <disabled>
  #           <monitorspec>
  #             <connector>DP-1</connector>
  #           </monitorspec>
  #         </disabled>
  #       </configuration>
  #     </monitors>
  #   ''}"
  # ];
}
