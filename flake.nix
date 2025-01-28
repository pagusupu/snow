{
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (let
      system = "x86_64-linux";
    in {
      flake.nixosConfigurations.aoi = let
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
    nixpkgs.follows = "stable";
    stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "stable";
    };
    qbit.url = "github:fsnkty/nixpkgs?ref=init-nixos-qbittorrent";
    yazi-plugins.url = "github:pagusupu/nix-yazi-plugins";

    # parts
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "unstable";
    };
    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "unstable";
    };
    hosts = {
      url = "github:StevenBlack/hosts";
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
