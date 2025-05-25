_: {
  home-manager.users.pagu = {
    programs.ghostty = {
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
  };
}
