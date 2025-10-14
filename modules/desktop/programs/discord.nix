{inputs, ...}: {
  home-manager.users.pagu = {
    programs.nixcord = {
      enable = true;
      discord.enable = false;
      vesktop = {
        enable = true;
        settings = {
          appBadge = false;
          arRPC = true;
          discordBranch = "stable";
          hardwareVideoAcceleration = true;
          staticTitle = true;
          tray = false;
          # rose pine
          splashBackground = "rgb(26, 24, 37)";
          splashColor = "rgb(192, 189, 219)";
        };
      };
      config = {
        plugins = {
          accountPanelServerProfile = {
            enable = true;
            prioritizeServerProfile = true;
          };
          alwaysTrust = {
            enable = true;
            file = true;
          };
          anonymiseFileNames = {
            enable = true;
            anonymiseByDefault = true;
          };
          betterNotesBox = {
            enable = true;
            noSpellCheck = true;
          };
          callTimer = {
            enable = true;
            format = "human";
          };
          ignoreActivities = {
            enable = true;
            ignoreCompeting = true;
            ignorePlaying = true;
            ignoreStreaming = true;
          };
          newGuildSettings = {
            enable = true;
            messages = "only@Mentions";
            everyone = false;
            role = false;
            showAllChannels = false;
          };
          noBlockedMessages = {
            enable = true;
            ignoreBlockedMessages = true;
          };
          notificationVolume = {
            enable = true;
            notificationVolume = 50.0;
          };
          openInApp = {
            enable = true;
            epic = false;
            itunes = false;
            spotify = false;
            tidal = false;
          };
          typingTweaks = {
            enable = true;
            showRoleColors = false;
          };
          alwaysAnimate.enable = true;
          alwaysExpandRoles.enable = true;
          betterGifAltText.enable = true;
          betterUploadButton.enable = true;
          biggerStreamPreview.enable = true;
          clearURLs.enable = true;
          disableCallIdle.enable = true;
          dontRoundMyTimestamps.enable = true;
          favoriteEmojiFirst.enable = true;
          favoriteGifSearch.enable = true;
          fakeNitro.enable = true;
          fixImagesQuality.enable = true;
          fixSpotifyEmbeds.enable = true;
          fixYoutubeEmbeds.enable = true;
          fullSearchContext.enable = true;
          gameActivityToggle.enable = true;
          hideMedia.enable = true;
          loadingQuotes.enable = true;
          messageClickActions.enable = true;
          noF1.enable = true;
          noOnboardingDelay.enable = true;
          noProfileThemes.enable = true;
          onePingPerDM.enable = true;
          petpet.enable = true;
          plainFolderIcon.enable = true;
          previewMessage.enable = true;
          stickerPaste.enable = true;
          unindent.enable = true;
          userMessagesPronouns.enable = true;
          voiceChatDoubleClick.enable = true;
          webRichPresence.enable = true;
          webScreenShareFixes.enable = true;
          whoReacted.enable = true;
          youtubeAdblock.enable = true;
        };
        themeLinks = ["https://raw.githubusercontent.com/refact0r/midnight-discord/refs/heads/master/themes/flavors/midnight-rose-pine.theme.css"];
        useQuickCss = true;
      };
      quickCss = ''
        @import url(https://croissantdunord.github.io/discord-adblock/adblock.css);
        body { --font: ""; }
      '';
      extraConfig.SKIP_HOST_UPDATE = true;
    };
    services.arrpc.enable = true;
    imports = [inputs.nixcord.homeModules.nixcord];
  };
}
