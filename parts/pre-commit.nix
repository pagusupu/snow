{inputs, ...}: {
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    pre-commit.settings = {
      hooks = {
        alejandra.enable = true;
        deadnix.enable = true;
        nil.enable = true;
        statix.enable = true;
      };
      excludes = ["flake.lock"];
    };
    devShells.default = pkgs.mkShell {
      shellHook = config.pre-commit.installationScript;
    };
  };
  imports = [inputs.pre-commit-hooks.flakeModule];
}
