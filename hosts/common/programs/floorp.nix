{
  inputs,
  pkgs,
  ...
}: {
  home-manager.users.pagu = {
    programs.floorp = {
      enable = true;
      profiles.pagu = {
        extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          darkreader
          linkding-extension
          return-youtube-dislikes
          sponsorblock
          ublock-origin
        ];
        /*
           search = {
          default = "st";
          order = [
            "st"
            "google"
          ];
          engines = {
            "Warframe Wiki" = {
              urls = [{template = "https://wiki.warframe.com/?search={searchTerms}";}];
              definedAliases = ["@wf"];
            };
            "bing".metaData.hidden = true;
            "ddg".metaData.hidden = true;
            "yc".metaData.hidden = true;
          };
          force = true;
        };
        */
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
