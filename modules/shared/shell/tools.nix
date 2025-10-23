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
          "--no-time"
          "--octal-permissions"
        ];
        icons = "auto";
      };
      zoxide.enable = true;
    };
    home.packages = let
      ouch = pkgs.ouch.override {enableUnfree = true;};
    in
      [
        ouch
        inputs.paguvim.packages.${pkgs.system}.default
      ]
      ++ (with pkgs; [
        dust
        nurl
        rip2
        wget
      ]);
  };
  environment = {
    binsh = lib.getExe pkgs.dash;
    sessionVariables.EDITOR = "nvim";
  };
}
