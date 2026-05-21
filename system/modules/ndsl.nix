{ lib, ... }:
let
  themeType=lib.types.submodule{
    options={
      name=lib.mkOption{
        type=lib.types.str;
      };
      package=lib.mkOption{
        type=lib.types.nullOr lib.types.package;
        default=null;
      };
    };
  };
  fontType=lib.types.submodule{
    options={
      names=lib.mkOption{
        type=lib.types.listOf lib.types.str;
      };
      packages=lib.mkOption{
        type=lib.types.listOf lib.types.package;
        default=null;
      };
    };
  };
in{
  options.ndsl = {
    hostname=lib.mkOption{
      type=lib.types.str;
      default="nixos";
    };
    primaryUser=lib.mkOption{
      type=lib.types.str;
      default="ielxm";
    };
    appearance.themes=lib.mkOption{
      type=lib.types.submodule{
        options={
          gtk=lib.mkOption{type=themeType;default={};};
          qt=lib.mkOption{type=themeType;default={};};
          cursor=lib.mkOption{type=themeType;default={};};
          icons=lib.mkOption{type=themeType;default={};};
        };
      };
    };
    appearance.fonts=lib.mkOption{
      type=lib.types.submodule{
        options={
          serif=lib.mkOption{type=fontType;default={};};
          sansSerif=lib.mkOption{type=fontType;default={};};
          monospace=lib.mkOption{type=fontType;default={};};
        };
      };
    };
  };
}
