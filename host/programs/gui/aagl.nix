{
  config,
  lib,
  cutelib,
  inputs,
  ...
}: {
  imports = [ inputs.aagl.nixosModules.default ];
  options.cute.programs.gui.aagl = cutelib.mkEnable;
  config = lib.mkIf config.cute.programs.gui.aagl {
    nix.settings = {
      substituters = [ "https://ezkea.cachix.org" ];
      trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
    };
    programs.honkers-railway-launcher.enable = true;
  };
}
