{inputs, ...}: {
  perSystem = _: {
    treefmt = {
      settings.global.excludes = [
        ".direnv/**"
        ".envrc"
        "parts/secrets/*.age"
      ];
      programs = {
        alejandra.enable = true;
        deadnix.enable = true;
        # mdformat.enable = true;
        statix.enable = true;
      };
      flakeCheck = false;
      projectRootFile = "flake.nix";
    };
  };
  imports = [inputs.treefmt-nix.flakeModule];
}
