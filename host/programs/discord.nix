{inputs, ...}: {
  home-manager.users.pagu = {
    programs.nixcord = {
      enable = true;
      discord.enable = false;
      vesktop.enable = true;
      config = {
        plugins = {
          alwaysTrust = {
            enable = true;
            file = true;
          };
          anonymiseFileNames = {
            enable = true;
            anonymiseByDefault = true;
          };
          newGuildSettings = {
            enable = true;
            messages = "only@Mentions";
            everyone = false;
            role = false;
          };
          notificationVolume = {
            enable = true;
            notificationVolume = 50.0;
          };
          pinDMs = {
            enable = false;
            pinOrder = "custom";
          };
          alwaysAnimate.enable = true;
          betterSettings.enable = true;
          betterUploadButton.enable = true;
          clearURLs.enable = true;
          disableCallIdle.enable = true;
          favoriteEmojiFirst.enable = true;
          favoriteGifSearch.enable = true;
          fixSpotifyEmbeds.enable = true;
          fixYoutubeEmbeds.enable = true;
          noF1.enable = true;
          noMosaic.enable = true;
          noOnboardingDelay.enable = true;
          noProfileThemes.enable = true;
          onePingPerDM.enable = true;
          plainFolderIcon.enable = true;
          stickerPaste.enable = true;
          voiceChatDoubleClick.enable = true;
          youtubeAdblock.enable = true;
        };
        themeLinks = [ "https://catppuccin.github.io/discord/dist/catppuccin-frappe-pink.theme.css" ];
      };
      extraConfig.SKIP_HOST_UPDATE = true;
    };
    imports = [ inputs.nixcord.homeManagerModules.nixcord ];
  };
}
