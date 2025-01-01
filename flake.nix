{
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      flake.nixosConfigurations.aoi = let
        inherit (inputs.nixpkgs.lib) nixosSystem hasSuffix filesystem;
        inherit (builtins) concatMap filter;
      in
        nixosSystem {
          modules = concatMap (x:
            filter (hasSuffix ".nix")
            (map toString (filesystem.listFilesRecursive x)))
          [ ./host ];
          specialArgs.inputs = inputs;
          system = "x86_64-linux";
        };
      imports = [ ./parts ];
      systems = [ "x86_64-linux" ];
    };
  inputs = {
    nixpkgs.follows = "stable";
    stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "unstable";
    };
    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hosts = {
      url = "github:StevenBlack/hosts";
      inputs.nixpkgs.follows = "unstable";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "stable";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "unstable";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    qbit.url = "github:fsnkty/nixpkgs?ref=init-nixos-qbittorrent";
  };
  description = "the cutest flake";
}
