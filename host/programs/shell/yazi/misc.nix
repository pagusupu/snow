{
  home-manager.users.pagu = {
    programs.yazi = {
      settings.plugin.prepend_previewers = let
        rp = type: {
          name = "*.${type}";
          run = "rich-preview";
        };
      in [
        # rich-preview
        (rp "csv")
        (rp "md")
        (rp "rst")
        (rp "json")
        # exifaudio
        # not updated to latest api
        /*
          {
          mime = "audio/*";
          run = "exifaudio";
        }
        */
        # mediainfo
        {
          mime = "{image,video}/*";
          run = "mediainfo";
        }
        {
          mime = "application/subrip";
          run = "mediainfo";
        }
        # torrent-preview
        # not updated to latest api
        /*
          {
          mime = "application/bittorrent";
          run = "torrent-preview";
        }
        */
      ];
      # ui plugins
      initLua = ''
        require("full-border"):setup()
        require("no-status"):setup()
        require("starship"):setup()
      '';
    };
  };
}
