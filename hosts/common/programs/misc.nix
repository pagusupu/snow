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
      bitwarden-desktop
      celluloid
      feishin
      impression
      libreoffice-qt-fresh
      obsidian
      kdePackages.okular
      resources
      standardnotes
    ];
    services.trayscale.enable = true;
  };
  programs.localsend.enable = true;
}
