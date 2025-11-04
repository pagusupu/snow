{pkgs, ...}: {
  home-manager.users.pagu = {
    programs.yazi = {
      enable = true;
      plugins = {
        inherit
          (pkgs.yaziPlugins)
          full-border
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
        plugin.prepend_previewers = let
          ouch = type: {
            mime = "application/${type}";
            run = "ouch";
          };
          rich = type: {
            name = "*.${type}";
            run = "rich-preview";
          };
        in [
          (ouch "*zip")
          (ouch "x-tar")
          (ouch "x-rar")
          (ouch "x-7z-compressed")
          (rich "md")
          (rich "json")
        ];
      };
      initLua = ''
        require("full-border"):setup()
        require("no-status"):setup()
        require("starship"):setup()
      '';
    };
    home.packages = [pkgs.rich-cli];
  };
}
