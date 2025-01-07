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
    assertions = cutelib.assertHm "floorp";
    home-manager.users.pagu = {
      programs.floorp = {
        enable = true;
        package = pkgs.floorp.override { cfg.speechSynthesisSupport = false; };
        profiles.pagu = {
          extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
            bitwarden
            darkreader
            facebook-container
            firefox-color
            linkding-extension
            return-youtube-dislikes
            sponsorblock
            stylus
            tree-style-tab
            ublock-origin
            youtube-recommended-videos
          ];
          settings = {
            "browser.startup.homepage" = "http://192.168.178.182:8333";
            "browser.aboutConfig.showWarning" = false;
            "browser.EULA.override" = true;
            "extensions.webextensions.restrictedDomains" = "";
            "gfx.webrender.all" = true;
            "privacy.firstparty.isolate" = true;
            "privacy.resistFingerprinting.block_mozAddonManager" = true;
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
        policies = {
          CaptivePortal = false;
          DisableFeedbackCommands = true;
          DisableFirefoxAccounts = true;
          DisableFirefoxScreenshots = true;
          DisableFirefoxStudies = true;
          DisablePocket = true;
          DisableProfileImport = true;
          DisableProfileRefresh = true;
          DisableSetDesktopBackground = true;
          DisplayBookmarksToolbar = "never";
          DontCheckDefaultBrowser = true;
          HardwareAcceleration = true;
          NoDefaultBookmarks = true;
          PasswordManagerEnabled = false;
          Cookies = {
            Behavior = "reject-tracker-and-partition-foreign";
            Locked = true;
          };
          FirefoxHome = {
            Highlights = false;
            Pocket = false;
            Snippets = false;
            TopSites = false;
            Locked = true;
          };
          FirefoxSuggest = {
            ImproveSuggest = false;
            SponsoredSugRegexgestions = false;
            WebSuggestions = true;
            Locked = true;
          };
          UserMessaging = {
            ExtensionRecommendations = false;
            FeatureRecommendations = false;
            MoreFromMozilla = false;
            SkipOnboarding = true;
            WhatsNew = false;
            Locked = true;
          };
          SanitizeOnShutdown = {
            Cache = false;
            Cookies = false;
            History = false;
            Sessions = true;
            SiteSettings = false;
            OfflineApps = true;
            Locked = true;
          };
        };
      };
    };
    environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";
  };
}
