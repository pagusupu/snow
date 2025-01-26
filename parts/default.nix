{inputs, ...}: {
  imports = [
    ./fmt.nix
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {
    pkgs,
    config,
    lib,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      shellHook = config.pre-commit.installationScript;
    };
    packages = lib.mkMerge [
      (lib.packagesFromDirectoryRecursive {
        directory = ./pkgs;
        inherit (pkgs) callPackage;
      })
      { nix = pkgs.lix; }
    ];
    overlayAttrs = config.packages;
  };
}
