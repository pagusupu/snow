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

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions/badfc272422134c7201891e1c1b8a3d465270956?dir=pkgs/firefox-addons";
      # url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
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

    # parts
    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "unstable";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "unstable";
    };
    easy-hosts.url = "github:tgirlcloud/easy-hosts";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
}
