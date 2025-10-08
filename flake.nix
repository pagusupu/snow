{
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [./hosts ./parts];
      systems = ["x86_64-linux"];
    };

  inputs = {
    nixpkgs.follows = "unstable";
    stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hosts.url = "github:StevenBlack/hosts";
    nixcord.url = "github:kaylorben/nixcord";
    nix-gaming.url = "github:fufexan/nix-gaming";
    paguvim.url = "github:pagusupu/paguvim";

    cmake-workaround.url = "github:NixOS/nixpkgs/7df7ff7d8e00218376575f0acdcc5d66741351ee";

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
