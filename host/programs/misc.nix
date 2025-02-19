{
  inputs,
  pkgs,
  lib,
  ...
}: {
  programs = {
    honkers-railway-launcher.enable = true;
    localsend.enable = true;
  };
  home-manager.users.pagu = {
    programs = {
      ghostty = {
        enable = true;
        settings = {
          confirm-close-surface = false;
          cursor-style = "underline";
          cursor-style-blink = false;
          keybind = ["ctrl+shift+w=close_surface"];
          term = "xterm-256color";
          theme = "Espresso";
        };
        enableFishIntegration = true;
      };
      mpv.enable = true;
    };
    home.packages = with pkgs; [
      bitwarden-desktop
      cartridges
      celluloid
      feishin
      heroic
      libreoffice-qt-fresh
      prismlauncher
      qbittorrent
      radeontop
      signal-desktop
      standardnotes
    ];
    services.trayscale.enable = true;
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
  imports = [inputs.aagl.nixosModules.default];
}
