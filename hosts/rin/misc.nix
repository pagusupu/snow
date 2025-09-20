{
  inputs,
  pkgs,
  lib,
  ...
}: {
  networking = {
    hostName = "rin";
    hostId = "6f257938";
  };

  home-manager.users.pagu.home.packages = let
    bottles = pkgs.bottles.override {removeWarningPopup = true;};
  in
    with pkgs; [
      bottles
      cartridges
      downsampler-threaded
      heroic
      prismlauncher
      qbittorrent
      rstudio
      ryubing
      wowup-cf
      youtube-music
      inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    ];

  environment.etc = {
    "jdks/21".source = lib.getBin pkgs.openjdk21;
    "jdks/17".source = lib.getBin pkgs.openjdk17;
    "jdks/8".source = lib.getBin pkgs.openjdk8;
  };

  imports = with inputs; [
    aagl.nixosModules.default
    nix-gaming.nixosModules.pipewireLowLatency
  ];
  nix.settings = {
    substituters = [
      "https://nix-gaming.cachix.org"
      "https://ezkea.cachix.org"
    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];
  };
  services.pipewire.lowLatency = {
    enable = true;
    quantum = 48;
    rate = 48000;
  };
  programs.anime-game-launcher.enable = true;
}
