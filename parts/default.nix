{inputs, ...}: {
  imports = [
    ./treefmt.nix
    ./pre-commit.nix
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {
    pkgs,
    config,
    lib,
    ...
  }: {
    packages = lib.mkMerge [
      (lib.packagesFromDirectoryRecursive {
        directory = ./pkgs;
        inherit (pkgs) callPackage;
      })
      {nix = pkgs.nixVersions.latest;}
    ];
    overlayAttrs = config.packages;
  };
}
