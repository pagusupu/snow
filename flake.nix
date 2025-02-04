{
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} (let
      system = "x86_64-linux";
    in {
      flake.nixosConfigurations.rin = let
        inherit (inputs.nixpkgs.lib) nixosSystem hasSuffix filesystem;
        inherit (builtins) concatMap filter;
      in
        nixosSystem {
          modules = concatMap (x:
            filter (hasSuffix ".nix")
            (map toString (filesystem.listFilesRecursive x)))
          [./host];
          specialArgs = {inherit inputs;};
          inherit system;
        };
      imports = [./parts];
      systems = [system];
    });
  inputs = {
    nixpkgs.follows = "unstable";
    stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "unstable";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
    hosts.url = "github:StevenBlack/hosts";
    nixcord.url = "github:kaylorben/nixcord";
    nix-gaming.url = "github:fufexan/nix-gaming";
    paguvim.url = "github:pagusupu/paguvim";
    #yazi-plugins.url = "github:pagusupu/nix-yazi-plugins";
    yazi-plugins.url = "git+file:/home/pagu/code/nix-yazi-plugins";

    # parts
    pre-commit-hooks = {
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
