{pkgs, ...}: {
  home-manager.users.pagu = {
    programs.yazi = {
      enable = true;
      settings.manager = {
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
      };
      plugins = {
        ouch = pkgs.fetchFromGitHub {
          owner = "ndtoan96";
          repo = "ouch.yazi";
          rev = "ce6fb75431b9d0d88efc6ae92e8a8ebb9bc1864a";
          hash = "sha256-oUEUGgeVbljQICB43v9DeEM3XWMAKt3Ll11IcLCS/PA=";
        };
        torrent-preview = pkgs.fetchFromGitHub {
          owner = "kirasok";
          repo = "torrent-preview.yazi";
          rev = "169cafcb6f1b0aeef647c7598845e1e09651c3a8";
          hash = "sha256-taLlWoC57h8N8Yj2wD/dY+piVPgNk1F85+QIuJfQRoQ=";
        };
        /*
        installed via ya:
        - Sonico98/exifaudio.yazi
        - yazi-rs/full-border.yazi
        - boydaihungst/mediainfo.yazi
        - yazi-rs/no-status.yazi
        - AnirudhG07/rich-preview.yazi
        - Rolv-Apneseth/starship.yazi
        */
      };
    };
    home.packages = with pkgs; [
      exiftool # exifaudio
      ffmpeg # mediainfo
      mediainfo # exifaudio & mediainfo
      ouch
      rich-cli # rich preview
      starship
      transmission_4 # torrent-preview
    ];
  };
}
