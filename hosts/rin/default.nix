{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./grub.nix
    ./hardware.nix
  ];

  home-manager.users.pagu.home = {
    packages = let
      bottles = pkgs.bottles.override {removeWarningPopup = true;};
    in
      with pkgs; [
        bottles
        cartridges
        downsampler-threaded
        eclipses.eclipse-java
        heroic
        prismlauncher
        qbittorrent
        rstudio
        wowup-cf
        youtube-music
      ];
    stateVersion = "24.11";
  };
  system.stateVersion = "24.11";

  networking = {
    hostName = "rin";
    hostId = "6f257938";
  };

  environment.etc = {
    "jdks/21".source = lib.getBin pkgs.openjdk21;
    "jdks/17".source = lib.getBin pkgs.openjdk17;
    "jdks/8".source = lib.getBin pkgs.openjdk8;
  };
}
