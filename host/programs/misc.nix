{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.aagl.nixosModules.default];
  programs = {
    honkers-railway-launcher.enable = true;
    kdeconnect.enable = true;
    localsend.enable = true;
  };
  home-manager.users.pagu = {
    catppuccin = {
      fish.enable = true;
      ghostty.enable = true;
      mpv.enable = true;
    };
    programs = {
      ghostty = {
        enable = true;
        settings = {
          confirm-close-surface = false;
          cursor-style = "underline";
          cursor-style-blink = false;
          term = "xterm-256color";
        };
        enableFishIntegration = true;
      };
      mpv.enable = true;
    };
    home.packages = with pkgs; [
      bitwarden-desktop
      cartridges
      feishin
      heroic
      kooha
      libreoffice-qt-fresh
      radeontop
      standardnotes
      trayscale
      inputs.paguvim.packages.${pkgs.system}.default
    ];
  };
  nix.settings = {
    substituters = ["https://ezkea.cachix.org"];
    trusted-public-keys = ["ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="];
  };
  nixpkgs.config.permittedInsecurePackages = ["electron-31.7.7"]; # feishin
}
