{
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [./parts];
      systems = ["x86_64-linux"];
    };

  inputs = {
    nixpkgs.follows = "unstable";
    stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "unstable";
    };
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "stable";
    };

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    nixcord.url = "github:kaylorben/nixcord";
    nix-gaming.url = "github:fufexan/nix-gaming";
    paguvim.url = "github:pagusupu/paguvim";

    # parts
    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "unstable";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "unstable";
    };
    agenix.url = "github:ryantm/agenix";
    easy-hosts.url = "github:tgirlcloud/easy-hosts";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
}
