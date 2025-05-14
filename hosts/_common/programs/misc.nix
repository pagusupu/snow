{pkgs, ...}: {
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
          theme = "rose-pine";
        };
        enableFishIntegration = true;
      };
      mpv.enable = true;
    };
    home.packages = with pkgs; [
      celluloid
      feishin
      radeontop
      resources
    ];
    services.trayscale.enable = true;
  };
  programs = {
    goldwarden.enable = true;
    localsend.enable = true;
  };

  # feishin
  nixpkgs.config.permittedInsecurePackages = ["electron-33.4.11"];
}
