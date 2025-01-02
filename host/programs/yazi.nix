{
  config,
  lib,
  cutelib,
  inputs,
  pkgs,
  ...
}: {
  options.cute.programs.yazi = cutelib.mkEnable;
  config = lib.mkIf config.cute.programs.yazi {
    home-manager.users.pagu = {
      programs.yazi = {
        enable = true;
        package = inputs.unstable.legacyPackages.${pkgs.system}.yazi;
        settings = {
          manager = {
            show_hidden = true;
            sort_by = "natural";
            sort_dir_first = true;
          };
          plugin.prepend_previewers = [
            {
              name = "*/";
              run = "eza-preview";
            }
            {
              mime = "audio/*";
              run = "exifaudio";
            }
          ];
        };
        keymap.manager.prepend_keymap = [
          {
            on = "E";
            run = "plugin eza-preview";
          }
        ];
        plugins = let
          yazi-plugins = pkgs.fetchFromGitHub {
            owner = "yazi-rs";
            repo = "plugins";
            rev = "71c4fc2e6fa1d6f70c85bf525842d6888d1ffa46";
            hash = "sha256-X3R5bsnzGv1TVXOKdhAyspDMguVAyc9tvCxJlypUUAA=";
          };
        in {
          full-border = "${yazi-plugins}/full-border.yazi";
          no-status = "${yazi-plugins}/no-status.yazi";
          exifaudio = pkgs.fetchFromGitHub {
            owner = "Sonico98";
            repo = "exifaudio.yazi";
            rev = "d7946141c87a23dcc6fb3b2730a287faf3154593";
            hash = "sha256-nXBxPG6PVi5vstvVMn8dtnelfCa329CTIOCdXruOxT4=";
          };
          eza-preview = pkgs.fetchFromGitHub {
            owner = "ahkohd";
            repo = "eza-preview.yazi";
            rev = "5ef05bcee141291566276e62cc16e265a387dca4";
            hash = "sha256-L7i+uL2kAx3AUr5EAzRrduoV2m4+/tE1gCfbTOSuAc4=";
          };
          starship = pkgs.fetchFromGitHub {
            owner = "Rolv-Apneseth";
            repo = "starship.yazi";
            rev = "9c37d37099455a44343f4b491d56debf97435a0e";
            hash = "sha256-wESy7lFWan/jTYgtKGQ3lfK69SnDZ+kDx4K1NfY4xf4=";
          };
        };
        initLua =
          # lua
          ''
            require("full-border"):setup()
            require("no-status"):setup()
            require("starship"):setup()
          '';
      };
      # need to be in $PATH for plugins
      home.packages = with pkgs; [
        exiftool
        eza
        mediainfo
        starship
      ];
    };
  };
}
