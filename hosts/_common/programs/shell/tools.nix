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
        config.theme = "ansi";
      };
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
      eza = {
        enable = true;
        icons = "auto";
        extraOptions = ["--group-directories-first"];
      };
      yazi = let
        unstable = inputs.unstable.legacyPackages.${pkgs.system};
      in {
        enable = true;
        package = unstable.yazi;
        settings.manager = {
          show_hidden = true;
          sort_by = "natural";
          sort_dir_first = true;
        };

        /*
           plugins = {
          inherit
            (unstable.yaziPlugins)
            full-border
            no-status
            starship
            ;
        };
        */

        # installed via ya until hm module updates
        initLua = ''
          require("full-border"):setup()
          require("no-status"):setup()
          require("starship"):setup()
        '';
      };
      zoxide.enable = true;
    };
  };
  environment = {
    systemPackages = with pkgs; [
      dust
      nurl
      ouch
      rip2
      wget
      inputs.paguvim.packages.${pkgs.system}.default
    ];
    sessionVariables = {
      DIRENV_LOG_FORMAT = "";
      EDITOR = "nvim";
    };
    binsh = lib.getExe pkgs.dash;
  };
}
