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
        # installed via ya
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
    binsh = lib.getExe pkgs.dash;
    sessionVariables.DIRENV_LOG_FORMAT = "";
  };
}
