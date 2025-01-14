{
  config,
  lib,
  cutelib,
  inputs,
  pkgs,
  ...
}: {
  options.cute.programs.gui.floorp = cutelib.mkEnable;
  config = lib.mkIf config.cute.programs.gui.floorp {
    home-manager.users.pagu = {
      programs.floorp = {
        enable = true;
        package = pkgs.floorp.override { cfg.speechSynthesisSupport = false; };
        profiles.pagu = {
          extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
            bitwarden
            darkreader
            facebook-container
            linkding-extension
            return-youtube-dislikes
            sponsorblock
            stylus
            tree-style-tab
            ublock-origin
            # youtube-recommended-videos
          ];
          settings = {
            "browser.aboutConfig.showWarning" = false;
            "browser.EULA.override" = true;
            "gfx.webrender.all" = true;
          };
          search = {
            default = "DuckDuckGo";
            order = [
              "DuckDuckGo"
              "Google"
            ];
            engines = {
              "Bing".metaData.hidden = true;
              "Startpage".metaData.hidden = true;
              "You.com".metaData.hidden = true;
            };
            force = true;
          };
        };
      };
    };
    environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";
  };
}
