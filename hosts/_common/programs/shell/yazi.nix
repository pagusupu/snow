{pkgs, ...}: {
  home-manager.users.pagu = {
    programs.yazi = {
      enable = true;
      plugins = {
        inherit
          (pkgs.yaziPlugins)
          full-border
          mediainfo
          no-status
          ouch
          rich-preview
          starship
          ;
      };
      settings = {
        mgr = {
          show_hidden = true;
          sort_by = "natural";
          sort_dir_first = true;
        };
        plugin = let
          ouch = type: {
            mime = "application/${type}";
            run = "ouch";
          };
          rich = type: {
            name = "*.${type}";
            run = "rich-preview";
          };
          media = type: {
            mime = type;
            run = "mediainfo";
          };
        in {
          prepend_previewers = [
            (ouch "*zip")
            (ouch "x-tar")
            (ouch "x-rar")
            (ouch "x-7z-compressed")

            (rich "md")
            (rich "json")

            (media "{audio,video,image}/*")
            (media "application/subrip")
          ];
          prepend_preloaders = [
            (media "{audio,video,image}/*")
            (media "application/subrip")
          ];
        };
      };
      initLua = ''
        require("full-border"):setup()
        require("no-status"):setup()
        require("starship"):setup()
      '';
    };
    home.packages = with pkgs; [
      imagemagick
      mediainfo
      rich-cli
    ];
  };
}
