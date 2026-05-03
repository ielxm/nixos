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

          system = "x86_64-linux";

          modules = [
            ./modules/base.nix

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

        qemu-guest = nixpkgs.lib.nixosSystem {

          system = "x86_64-linux";

          specialArgs = { inherit inputs; };

          modules = [
            ./modules/base.nix

            ./machines/qemu-guest/hardware-configuration.nix
            ./machines/qemu-guest/console.nix
            ./machines/qemu-guest/network-configuration.nix
            ./machines/qemu-guest/users.nix
            ./machines/qemu-guest/packages.nix
            ./machines/qemu-guest/services.nix

            #agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };

              home-manager.users.root  = ./home-manager/qemu-guest/root.nix;
              home-manager.users.ielxm = ./home-manager/qemu-guest/ielxm.nix;
            }
          ];
        };
       
      };
    };
}
