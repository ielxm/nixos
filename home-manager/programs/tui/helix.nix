{ pkgs, ndsl, ... }:
{
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [ nixd ];
    themes.custom = {
      inherits = "ashen";
      "ui.background" = { };
    };
    settings = {
      theme = "custom";
      editor.soft-wrap.enable = true;
      editor.cursor-shape = {
        #normal = "bar";
        #select = "bar";
        insert = "bar";
      };
    };
    languages = {

      language = [
        {
          name = "nix";
          auto-format = false;
        }
      ];

      language-server.nixd = {
        args = [ "--semantic-tokens=true" ];
        config.nixd = let
          myFlake = "(builtins.getFlake (builtins.toString /etc/nixos))";
          configurationName = ndsl.hostname;
          nixosOptions = "${myFlake}.nixosConfigurations.${configurationName}.options";
        in {
          nixpkgs.expr = "import ${myFlake}.inputs.nixpkgs { }";
          options = {
            nixos.expr = nixosOptions;
            home-manager.expr = "${nixosOptions}.home-manager.users.type.getSubOptions []";
          };
        };
      };

    };
  };
}
