{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    {
      nixosConfigurations = {

        pc = nixpkgs.lib.nixosSystem {

          #specialArgs = { inherit inputs; };
          system = "x86_64-linux";

          modules = [
            ./system/default.nix
            ./hosts/pc/default.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };

	            home-manager.users.root  = ./home-manager/pc/root.nix;
              home-manager.users.ielxm = ./home-manager/pc/home.nix;
            }
          ];
        };

      };
    };
}
