{
  config,
  lib,
  cutelib,
  pkgs,
  ...
}: {
  options.cute.programs.cli.tools = cutelib.mkEnable;
  config = lib.mkIf config.cute.programs.cli.tools {
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
          extraOptions = [ "--group-directories-first" ];
        };
        zoxide.enable = true;
      };
    };
    environment = {
      systemPackages = with pkgs; [
        dust
        nurl
        ouch
        wget
      ];
      binsh = lib.getExe pkgs.dash;
      sessionVariables.DIRENV_LOG_FORMAT = "";
    };
  };
}
