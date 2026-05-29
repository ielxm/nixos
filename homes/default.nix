{
  inputs,
  config,
  lib,
  ...
}:
{
  home-manager = {
    verbose = true;
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs;
      ndsl = config.ndsl;
    };

    users.root = ./ielxm/root.nix;
    users.ielxm = ./ielxm/home.nix;

    sharedModules = [
      {
        programs.home-manager.enable = true;
        home.stateVersion = "25.11";
      }
    ];
  };

}
