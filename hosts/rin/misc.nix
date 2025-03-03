{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = with inputs; [
    aagl.nixosModules.default
    nix-gaming.nixosModules.pipewireLowLatency
  ];

  networking = {
    hostName = "rin";
    hostId = "6f257938";
  };

  home-manager.users.pagu = {
    home.packages = with pkgs; [
      cartridges
      heroic
      prismlauncher
      qbittorrent
      radeontop
      signal-desktop
    ];
  };

  environment.etc = {
    "jdks/21".source = lib.getBin pkgs.openjdk21;
    "jdks/17".source = lib.getBin pkgs.openjdk17;
    "jdks/8".source = lib.getBin pkgs.openjdk8;
  };

  nix.settings = {
    substituters = ["https://ezkea.cachix.org"];
    trusted-public-keys = ["ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="];
  };
  programs.honkers-railway-launcher.enable = true;

  services.pipewire.lowLatency = {
    enable = true;
    quantum = 48;
    rate = 48000;
  };
}
