{pkgs, ...}: {
  home-manager.users.pagu = {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "toml"
        "rose-pine-theme"
      ];
      userSettings = {
        theme = {
          mode = "system";
          dark = "Rosé Pine";
          light = "Rosé Pine Dawn";
        };
        languages = {
          Nix = {
            formatter.external = {
              command = "alejandra";
              arguments = ["--quiet" "--"];
            };
            language_servers = ["nil" "!nixd"];
          };
          C = {
            format_on_save = "on";
            tab_size = 4;
          };
          "C++".format_on_save = "on";
        };
        terminal = {
          alternate_scroll = "off";
          cursor_shape = "bar";
          font_weight = 300;
          line_height = "standard";
        };
        auto_update = false;
        buffer_font_size = 14;
        buffer_font_family = "JetBrainsMono Nerd Font";
        close_on_file_delete = true;
        cursor_blink = false;
        disable_ai = true;
        load_direnv = "shell_hook";
        middle_click_paste = false;
        ui_font_size = 16;
      };
      extraPackages = with pkgs; [
        alejandra
        clang-tools
        nil
      ];
    };
  };
  programs.nix-ld.enable = true;
}
