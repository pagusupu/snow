{inputs, ...}: let
  inherit (inputs.nixpkgs) lib;
  mkHost = hosts:
    lib.genAttrs hosts (
      name:
        lib.nixosSystem {
          modules = builtins.concatMap (x:
            builtins.filter (lib.hasSuffix ".nix")
            (map toString (lib.filesystem.listFilesRecursive x)))
          [./${name} ./_common];
          specialArgs = {inherit inputs;};
          system = "x86_64-linux";
        }
    );
in {
  flake.nixosConfigurations = mkHost ["rin" "ryo"];
}
