{
  lib,
  pkgs,
  ...
}: {
  home-manager.users.pagu = {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "git-firefly"
        "java"
        "nix"
        "toml"
      ];
      userSettings = {
        theme = {
          mode = "system";
          dark = "Rosé Pine";
          light = "Rosé Pine Dawn";
        };
        languages = {
          C = {
            format_on_save = "on";
            tab_size = 4;
          };
          Nix = {
            formatter.external = {
              command = "alejandra";
              arguments = ["--quiet" "--"];
            };
            language_servers = ["nil" "!nixd"];
          };
        };
        lsp = {
          jdtls.binary.path = lib.getExe pkgs.jdt-language-server;
        };
        disable_ai = true;
        ui_font_size = 16;
        buffer_font_size = 14;
        buffer_font_family = "JetBrainsMono Nerd Font";
        load_direnv = "shell_hook";
      };
      extraPackages = with pkgs; [
        alejandra
        clang-tools
        jdk21
        nil
      ];
    };
  };
  programs.nix-ld.enable = true;
}
