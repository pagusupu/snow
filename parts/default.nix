{inputs, ...}: {
  imports = with inputs; [
    easy-hosts.flakeModule
    ./easy-hosts.nix
    pre-commit-hooks.flakeModule
    ./pre-commit.nix
    treefmt-nix.flakeModule
    ./treefmt.nix
    flake-parts.flakeModules.easyOverlay
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
