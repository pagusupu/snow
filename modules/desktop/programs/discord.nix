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
          hardwareVideoAcceleration = true;
          staticTitle = true;
          tray = false;
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
            messages = 1;
            everyone = false;
            role = false;
            showAllChannels = false;
          };
          notificationVolume = {
            enable = true;
            notificationVolume = 50.0;
          };
          PinDMs = {
            enable = true;
            canCollapseDmSection = true;
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
          ClearURLs.enable = true;
          disableCallIdle.enable = true;
          dontRoundMyTimestamps.enable = true;
          favoriteEmojiFirst.enable = true;
          favoriteGifSearch.enable = true;
          fakeNitro.enable = true;
          fixImagesQuality.enable = true;
          fixSpotifyEmbeds.enable = true;
          fixYoutubeEmbeds.enable = true;
          fullSearchContext.enable = true;
          hideMedia.enable = true;
          loadingQuotes.enable = true;
          mentionAvatars.enable = true;
          messageClickActions.enable = true;
          noBlockedMessages.enable = true;
          noF1.enable = true;
          noOnboardingDelay.enable = true;
          noProfileThemes.enable = true;
          OnePingPerDM.enable = true;
          openInApp.enable = true;
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
        themeLinks = ["https://refact0r.github.io/midnight-discord/build/midnight.css"];
        useQuickCss = true;
      };
      quickCss = ''
        body { --font: ""; }
        :root { --colors: off; }
      '';
      extraConfig.SKIP_HOST_UPDATE = true;
    };
    services.arrpc.enable = true;
    imports = [inputs.nixcord.homeModules.nixcord];
  };
}
