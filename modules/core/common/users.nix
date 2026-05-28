{ config, ... }:
{
  users.users.${config.ndsl.primaryUser} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
