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
        extraOptions = [
          "--group-directories-first"
          "--no-permissions"
          "--octal-permissions"
        ];
        icons = "auto";
      };
      zoxide.enable = true;
    };
    home.packages = with pkgs; [
      dust
      nurl
      rip2
      wget
      (ouch.override {enableUnfree = true;})
      inputs.paguvim.packages.${pkgs.system}.default
    ];
  };
  environment = {
    binsh = lib.getExe pkgs.dash;
    sessionVariables.EDITOR = "nvim";
  };
}
