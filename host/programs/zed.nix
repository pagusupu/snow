{pkgs, ...}: {
  home-manager.users.pagu = {
    programs.zed-editor = {
      enable = true;
      extensions = [ "catppuccin" "git-firefly" "nix" ];
      userSettings = {
        theme = {
          mode = "dark";
          dark = "Catppuccin Frappé - No Italics";
          light = "Catppuccin Frappé - No Italics";
        };
        languages.Nix = {
          formatter.external.command = "nixfmt";
          language_servers = [ "nil" "!nixd" ];
        };
        ui_font_size = 16;
        buffer_font_size = 14;
        buffer_font_family = "JetBrainsMono Nerd Font";
        load_direnv = "direct";
      };
      extraPackages = [ pkgs.nil pkgs.nixfmt-rfc-style ];
    };
  };
}
