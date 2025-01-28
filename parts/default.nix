{inputs, ...}: {
  imports = [
    ./fmt.nix
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {
    pkgs,
    inputs',
    config,
    lib,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      packages = [ inputs'.agenix.packages.default ];
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
