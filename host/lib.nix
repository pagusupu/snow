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
  };
}
