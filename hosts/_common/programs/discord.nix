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
          callTimer = {
            enable = true;
            format = "human";
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
          alwaysAnimate.enable = true;
          betterUploadButton.enable = true;
          clearURLs.enable = true;
          disableCallIdle.enable = true;
          favoriteEmojiFirst.enable = true;
          favoriteGifSearch.enable = true;
          fixImagesQuality.enable = true;
          fixSpotifyEmbeds.enable = true;
          fixYoutubeEmbeds.enable = true;
          gameActivityToggle.enable = true;
          loadingQuotes.enable = true;
          noF1.enable = true;
          noOnboardingDelay.enable = true;
          noProfileThemes.enable = true;
          onePingPerDM.enable = true;
          #plainFolderIcon.enable = true;
          stickerPaste.enable = true;
          voiceChatDoubleClick.enable = true;
          webRichPresence.enable = true;
          webScreenShareFixes.enable = true;
          youtubeAdblock.enable = true;
        };
        themeLinks = ["https://refact0r.github.io/midnight-discord/build/midnight.css"];
        useQuickCss = true;
      };
      quickCss = ":root { --colors: off; } body { --font: ''; }";
      extraConfig.SKIP_HOST_UPDATE = true;
    };
    services.arrpc.enable = true;
    imports = [inputs.nixcord.homeModules.nixcord];
  };
}
