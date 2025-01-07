{inputs, ...}: {
  home-manager.users.pagu = {
    programs.ghostty = {
      enable = true;
      package = inputs.ghostty.packages.x86_64-linux.default;
      settings = {
        cursor-style = "underline";
        cursor-style-blink = false;
        term = "xterm-256color";
        theme = "catppuccin-frappe";
      };
      enableFishIntegration = true;
    };
  };
}
