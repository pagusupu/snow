{
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (let
      system = "x86_64-linux";
    in {
      flake.nixosConfigurations.HOSTNAME = let
        inherit (inputs.nixpkgs.lib) nixosSystem hasSuffix filesystem;
        inherit (builtins) concatMap filter;
      in
        nixosSystem {
          modules = concatMap (x:
            filter (hasSuffix ".nix")
            (map toString (filesystem.listFilesRecursive x)))
          [ ./host ];
          specialArgs = { inherit inputs; };
          inherit system;
        };
      imports = [ ./parts ];
      systems = [ system ];
    });
  inputs = {
    nixpkgs.follows = "unstable";
    stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # parts
    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "unstable";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "unstable";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  description = "the cutest flake";
}
