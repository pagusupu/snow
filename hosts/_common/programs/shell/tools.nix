{
  lib,
  pkgs,
  inputs,
  ...
}: {
  home-manager.users.pagu = {
    programs = {
      bat = {
        enable = true;
        config.theme = "base16";
      };
      direnv = {
        enable = true;
        silent = true;
        nix-direnv.enable = true;
      };
      eza = {
        enable = true;
        icons = "auto";
        extraOptions = ["--group-directories-first"];
      };
      yazi = {
        enable = true;
        settings.manager = {
          show_hidden = true;
          sort_by = "natural";
          sort_dir_first = true;
        };
        plugins = {
          inherit
            (pkgs.yaziPlugins)
            full-border
            no-status
            starship
            ;
        };
        initLua = ''
          require("full-border"):setup()
          require("no-status"):setup()
          require("starship"):setup()
        '';
      };
      zoxide.enable = true;
    };
    home.packages = with pkgs; [
      dust
      nurl
      ouch
      rip2
      wget
      inputs.paguvim.packages.${pkgs.system}.default
    ];
  };
  environment = {
    binsh = lib.getExe pkgs.dash;
    sessionVariables.EDITOR = "nvim";
  };
}
