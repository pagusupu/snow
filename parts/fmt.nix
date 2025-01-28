{inputs, ...}: {
  imports = with inputs; [
    git-hooks-nix.flakeModule
    treefmt-nix.flakeModule
  ];
  perSystem = {config, ...}: let
    alejandra = {
      enable = true;
      package = config.packages.alejandra-custom;
    };
  in {
    pre-commit.settings = {
      hooks = {
        inherit alejandra;
        deadnix.enable = true;
        statix.enable = true;
        nil.enable = true;
      };
      excludes = [ "flake.lock" ];
    };
    treefmt = {
      settings.global.excludes = [
        ".direnv/**"
        ".envrc"
        "parts/secrets/*.age"
      ];
      programs = {
        inherit alejandra;
        deadnix.enable = true;
        mdformat.enable = true;
        statix.enable = true;
      };
      flakeCheck = false;
      projectRootFile = "flake.nix";
    };
  };
}
