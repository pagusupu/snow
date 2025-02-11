{
  inputs,
  pkgs,
  ...
}: {
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
          keybind = ["ctrl+shift+w=close_surface"];
          term = "xterm-256color";
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
      gnome-calculator
      heroic
      kooha
      libreoffice-qt-fresh
      radeontop
      signal-desktop
      standardnotes
      trayscale
    ];
  };
  nix.settings = {
    substituters = ["https://ezkea.cachix.org"];
    trusted-public-keys = ["ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="];
  };
  imports = [inputs.aagl.nixosModules.default];
}
