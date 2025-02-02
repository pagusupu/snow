{inputs, ...}: {
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    pre-commit.settings = {
      hooks = {
        alejandra = {
          enable = true;
          package = config.packages.alejandra-custom;
        };
        deadnix.enable = true;
        statix.enable = true;
        nil.enable = true;
      };
      excludes = [ "flake.lock" ];
    };
    devShells.default = pkgs.mkShell {
      shellHook = config.pre-commit.installationScript;
    };
  };
  imports = [ inputs.pre-commit-hooks.flakeModule ];
}
