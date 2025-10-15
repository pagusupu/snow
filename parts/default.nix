{inputs, ...}: {
  imports = with inputs; [
    ./easy-hosts.nix
    ./pre-commit.nix
    ./treefmt.nix
    easy-hosts.flakeModule
    pre-commit-hooks.flakeModule
    treefmt-nix.flakeModule
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
