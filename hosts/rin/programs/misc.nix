{
  inputs,
  pkgs,
  lib,
  ...
}: {
  home-manager.users.pagu = {
    home.packages = with pkgs; [
      cartridges
      heroic
      qbittorrent
      radeontop
      signal-desktop
    ];
  };

  environment = {
    etc = {
      "jdks/21".source = lib.getBin pkgs.openjdk21;
      "jdks/17".source = lib.getBin pkgs.openjdk17;
      "jdks/8".source = lib.getBin pkgs.openjdk8;
    };
    systemPackages = [pkgs.prismlauncher];
  };

  imports = [inputs.aagl.nixosModules.default];
  nix.settings = {
    substituters = ["https://ezkea.cachix.org"];
    trusted-public-keys = ["ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="];
  };
  programs.honkers-railway-launcher.enable = true;
}
