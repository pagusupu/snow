{pkgs, ...}: {
  home-manager.users.pagu = {
    programs.yazi = {
      enable = true;
      settings.manager = {
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
      };
      plugins = {
        inherit
          (pkgs.yaziPlugins)
          full-border
          no-status
          starship
          ;
      };
      initLua = ''
        require("full-border"):setup()
        require("no-status"):setup()
        require("starship"):setup()
      '';
    };
  };
}
