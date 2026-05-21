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

        nyx = nixpkgs.lib.nixosSystem {

          system = "x86_64-linux";

          modules = [
            ./system/hosts/nyx/hardware-configuration.nix

            ./system/modules/security.nix
            ./system/modules/network.nix
            ./system/modules/nix.nix
            ./system/modules/home-manager.nix
            ./system/modules/environment-variables.nix
            ./system/modules/kernel-parameters.nix
            ./system/modules/locale.nix
            ./system/modules/timezone.nix
            ./system/modules/console.nix
            ./system/modules/boot.nix
            ./system/modules/users.nix

            ./system/modules/virtualization.nix

            ./system/modules/pkgs/programs.nix
            ./system/modules/pkgs/services.nix
            ./system/modules/pkgs/packages.nix

            ./system/modules/pkgs/profiles/gaming.nix
            
            # flakes
            mangowm.nixosModules.mango

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = { inherit inputs; }; # развернуть inputs

	            home-manager.users.root  = ./home-manager/hosts/nyx/root.nix;
              home-manager.users.ielxm = ./home-manager/hosts/nyx/home.nix;
            }
          ];
        };

      };
    };
}
