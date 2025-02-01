{inputs, ...}: {
  perSystem = {config, ...}: {
    treefmt = {
      settings.global.excludes = [
        ".direnv/**"
        ".envrc"
        "parts/secrets/*.age"
      ];
      programs = {
        alejandra = {
          enable = true;
          package = config.packages.alejandra-custom;
        };
        deadnix.enable = true;
        mdformat.enable = true;
        statix.enable = true;
      };
      flakeCheck = false;
      projectRootFile = "flake.nix";
    };
  };
  imports = [ inputs.treefmt-nix.flakeModule ];
}
