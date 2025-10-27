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
    packages = with pkgs; [
      (bottles.override {removeWarningPopup = true;})
      cartridges
      downsampler-threaded
      heroic
      prismlauncher
      qbittorrent
      wowup-cf
      youtube-music

      eclipses.eclipse-java
      rstudio
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
