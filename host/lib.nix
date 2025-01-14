{
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) mkOption types;
  inherit (types) bool;
  inherit (inputs) stable unstable;
  inherit (pkgs) system;
in {
  _module.args.cutelib = {
    mkEnable = mkOption {
      default = false;
      type = bool;
    };
    mkEnabledOption = mkOption {
      default = true;
      type = bool;
    };
    stable = stable.legacyPackages.${system};
    unstable = unstable.legacyPackages.${system};
    wallpaper = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/orangci/walls-catppuccin-mocha/master/soft-rose.jpg";
      hash = "sha256-/ep92ydn2yWbQHAXyMT9VaBvPFviXJ+qOqXwAbrj8qM=";
    };
  };
}
