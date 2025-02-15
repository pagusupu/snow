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
