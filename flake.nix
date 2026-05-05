{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11"; # 25.11
    home-manager.url = "github:nix-community/home-manager/release-25.11"; # 25.11
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    {
      nixosConfigurations = {

        computer = nixpkgs.lib.nixosSystem {

          specialArgs = { inherit inputs; };
          system = "x86_64-linux";

          modules = [
            ./modules/default.nix

            ./machines/computer/hardware-configuration.nix
            ./machines/computer/vfio.nix
            ./machines/computer/nvidia.nix
            ./machines/computer/console.nix
            ./machines/computer/network.nix
            ./machines/computer/users.nix
            ./machines/computer/system-services.nix
            ./machines/computer/system-packages.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };

              home-manager.users.root  = ./home-manager/computer/root.nix;
              home-manager.users.ielxm = ./home-manager/computer/ielxm.nix;
            }
          ];
        };

      };
    };
}
