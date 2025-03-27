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

  home-manager.users.pagu = {
    home.packages = with pkgs; [
      cartridges
      heroic
      prismlauncher
      qbittorrent
      radeontop
      signal-desktop
      wowup-cf
      inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    ];
  };

  environment.etc = {
    "jdks/21".source = lib.getBin pkgs.openjdk21;
    "jdks/17".source = lib.getBin pkgs.openjdk17;
    "jdks/8".source = lib.getBin pkgs.openjdk8;
  };

  services.pipewire.lowLatency = {
    enable = true;
    quantum = 48;
    rate = 48000;
  };
  imports = [inputs.nix-gaming.nixosModules.pipewireLowLatency];
}
