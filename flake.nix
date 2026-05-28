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

        nyx = nixpkgs.lib.nixosSystem {

          system = "x86_64-linux";

          specialArgs = { inherit inputs; };

          modules = [

            ./hosts/nyx/hardware-configuration.nix

            ./modules/options/default.nix

            ({pkgs,...}: {
              ndsl.hostname="nyx";
              ndsl.primaryUser="ielxm";

              ndsl.appearance.themes.icons={
                name="Adwaita";
                package=pkgs.adwaita-icon-theme;
              };
              ndsl.appearance.fonts={
                serif={
                  names=[ "DejaVu Serif" "Noto Serif" ];
                  packages=[pkgs.dejavu_fonts pkgs.noto-fonts];
                };
                sansSerif={
                  names=[ "DejaVu Sans" "Noto Sans" ];
                  packages=[pkgs.dejavu_fonts pkgs.noto-fonts];
                };
                monospace={
                  names=[ "AdwaitaMono Nerd Font Mono" ];#[ "JetBrainsMono Nerd Font Mono" ];
                  packages=[pkgs.nerd-fonts.jetbrains-mono pkgs.nerd-fonts.iosevka pkgs.nerd-fonts.adwaita-mono];
                };
              };
            })

            ./modules/core/common/default.nix
            ./modules/core/common/pkgs/default.nix
            ./modules/core/common/profiles/gaming.nix            
            ./modules/core/common/profiles/virtualization.nixi

            home-manager.nixosModules.home-manager
            ({config,inputs,...}:{
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

	            home-manager.users.root  = ./homes/ielxm/root.nix;
              home-manager.users.ielxm = ./homes/ielxm/home.nix;
              
              home-manager.extraSpecialArgs = { inherit inputs; ndsl = config.ndsl; };
            })
          
          ];
        };

      };
    };
}
