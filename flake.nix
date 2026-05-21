{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, mangowm, home-manager, ... }:
    {
      nixosConfigurations = {

        pc = nixpkgs.lib.nixosSystem {

          system = "x86_64-linux";

          modules = [
            mangowm.nixosModules.mango

            ./hosts/nyx/hardware-configuration.nix
            ./modules-nixos/default.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; }; # развернуть inputs

	            home-manager.users.root  = ./hosts/nyx/hm-profiles/root.nix;
              home-manager.users.ielxm = ./hosts/nyx/hm-profiles/home.nix;
            }
          ];
        };

      };
    };
}
