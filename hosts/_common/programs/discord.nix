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
          fakeNitro.enable = true;
          fixImagesQuality.enable = true;
          fixSpotifyEmbeds.enable = true;
          fixYoutubeEmbeds.enable = true;
          gameActivityToggle.enable = true;
          loadingQuotes.enable = true;
          noF1.enable = true;
          noOnboardingDelay.enable = true;
          noProfileThemes.enable = true;
          onePingPerDM.enable = true;
          plainFolderIcon.enable = true;
          stickerPaste.enable = true;
          userMessagesPronouns.enable = true;
          voiceChatDoubleClick.enable = true;
          webRichPresence.enable = true;
          webScreenShareFixes.enable = true;
          youtubeAdblock.enable = true;
        };
        themeLinks = ["https://raw.githubusercontent.com/refact0r/midnight-discord/refs/heads/master/themes/flavors/midnight-rose-pine.theme.css"];
        useQuickCss = true;
      };
      quickCss = ''
        @import url("https://croissantdunord.github.io/discord-adblock/adblock.css");
        body { --font: ""; }
      '';
      extraConfig.SKIP_HOST_UPDATE = true;
    };
    services.arrpc.enable = true;
    imports = [inputs.nixcord.homeModules.nixcord];
  };
}
