{pkgs, ...}: {
  home-manager.users.pagu = {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "catppuccin"
        "git-firefly"
        "nix"
        "toml"
      ];
      userSettings = {
        theme = {
          mode = "system";
          dark = "One Dark";
          light = "One Light";
        };
        languages.Nix = {
          formatter.external.command = "nixfmt";
          language_servers = ["nil" "!nixd"];
        };
        ui_font_size = 16;
        buffer_font_size = 14;
        buffer_font_family = "JetBrainsMono Nerd Font";
        load_direnv = "direct";
      };
      extraPackages = with pkgs; [nil nixfmt-rfc-style];
    };
  };
}
