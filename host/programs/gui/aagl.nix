{
  config,
  lib,
  cutelib,
  inputs,
  pkgs,
  ...
}: {
  imports = [ inputs.aagl.nixosModules.default ];
  options.cute.programs.gui.aagl = cutelib.mkEnable;
  config = lib.mkIf config.cute.programs.gui.aagl {
    home-manager.users.pagu.home.file."honkers" = {
      target = ".local/share/honkers-railway-launcher/config.json";
      source = (pkgs.formats.json {}).generate "config.json" {
        game = {
          enhancements = {
            fsr.enabled = false;
            gamemode = true;
          };
          wine.selected = "wine-9.21-staging-tkg-amd64";
        };
        launcher.behavior = "Nothing";
      };
    };
    nix.settings = {
      substituters = [ "https://ezkea.cachix.org" ];
      trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
    };
    programs.honkers-railway-launcher.enable = true;
  };
}
