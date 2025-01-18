{
  inputs,
  pkgs,
  ...
}: {
  home-manager.users.pagu = {
    programs.floorp = {
      enable = true;
      profiles.pagu = {
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          darkreader
          linkding-extension
          return-youtube-dislikes
          sponsorblock
          stylus
          tree-style-tab
          ublock-origin
        ];
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
        settings = {
          "browser.aboutConfig.showWarning" = false;
          "browser.EULA.override" = true;
          "gfx.webrender.all" = true;
        };
      };
      policies = {
        DisableAppUpdate = true;
        DisableFirefoxAccounts = true;
        DisableFirefoxScreenshots = true;
        DisablePocket = true;
        DisableSetDesktopBackground = true;
        DisableTelemetry = true;
        NoDefaultBookmarks = true;
      };
    };
  };
  environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";
}
