{
  inputs,
  pkgs,
  ...
}: {
  imports = [ inputs.aagl.nixosModules.default ];
  programs = {
    honkers-railway-launcher.enable = true;
    kdeconnect.enable = true;
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
          term = "xterm-256color";
          theme = "catppuccin-frappe";
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
      libreoffice-qt-fresh
      protonmail-desktop
      radeontop
      standardnotes
      trayscale
    ];
  };
  nix.settings = {
    substituters = [ "https://ezkea.cachix.org" ];
    trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
  };
  nixpkgs.config.permittedInsecurePackages = [ "electron-31.7.7" ];
}
