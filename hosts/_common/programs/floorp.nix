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
          return-youtube-dislikes
          sponsorblock
          stylus
          ublock-origin
        ];
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
