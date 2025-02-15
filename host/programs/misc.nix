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
        };
        enableFishIntegration = true;
      };
      mpv.enable = true;
    };
    home.packages = with pkgs; [
      bitwarden-desktop
      celluloid
      feishin
      kooha
      libreoffice-qt-fresh
      standardnotes
    ];
    services.trayscale.enable = true;
  };
  programs.localsend.enable = true;
}
