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
          theme = "mellow";
        };
        enableFishIntegration = true;
      };
      mpv.enable = true;
    };
    home.packages = with pkgs; [
      celluloid
      feishin
      resources
    ];
    services.trayscale.enable = true;
  };
  programs.localsend.enable = true;

  # feishin
  nixpkgs.config.permittedInsecurePackages = ["electron-33.4.11"];
}
