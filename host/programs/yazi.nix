{
  config,
  lib,
  cutelib,
  pkgs,
  ...
}: {
  options.cute.programs.yazi = cutelib.mkEnable;
  config = lib.mkIf config.cute.programs.yazi {
    home-manager.users.pagu = {
      programs.yazi = let
        mocha = "catppuccin-mocha";
      in {
        enable = true;
        settings.manager = {
          show_hidden = true;
          sort_by = "natural";
          sort_dir_first = true;
        };
        flavors.${mocha} = let
          flavors = pkgs.fetchFromGitHub {
            owner = "yazi-rs";
            repo = "flavors";
            rev = "fc8eeaab9da882d0e77ecb4e603b67903a94ee6e";
            hash = "sha256-wvxwK4QQ3gUOuIXpZvrzmllJLDNK6zqG5V2JAqTxjiY=";
          };
        in "${flavors}/${mocha}.yazi";
        theme.flavor = {
          dark = mocha;
          light = mocha;
        };
        plugins = let
          yazi-plugins = pkgs.fetchFromGitHub {
            owner = "yazi-rs";
            repo = "plugins";
            rev = "540f4ea6d475c81cba8dac252932768fbd2cfd86";
            hash = "sha256-IRv75b3SR11WfLqGvQZhmBo1BuR5zsbZxfZIKDVpt9k=";
          };
        in {
          full-border = "${yazi-plugins}/full-border.yazi";
        };
        initLua = ''require("full-border"):setup()'';
      };
    };
  };
}
