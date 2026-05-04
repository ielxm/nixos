{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11"; # 25.11
    home-manager.url = "github:nix-community/home-manager/release-25.11"; # 25.11
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #agenix.url = "github:ryantm/agenix";

    db = {
      url = "git+ssh://git@github.com/ielxm/database.git";
      flake = false;
    };

  };

  outputs =
    #inputs@{ nixpkgs, agenix, home-manager, ... }:
    inputs@{ nixpkgs, home-manager, ... }:
    {
      nixosConfigurations = {

        # TODO: replace it
        computer = nixpkgs.lib.nixosSystem {

          specialArgs = { inherit inputs; };
          system = "x86_64-linux";

          modules = [
            ./modules/default.nix

            ./machines/computer/console.nix
            ./machines/computer/network.nix
            ./machines/computer/services.nix
            ./machines/computer/users.nix
            ./machines/computer/system-packages.nix

            #agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };

              home-manager.users.ielxm = ./home-manager/computer/ielxm.nix;
            }
          ];
        };

      };
    };
}
