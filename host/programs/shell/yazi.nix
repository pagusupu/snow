{
  inputs,
  pkgs,
  ...
}: {
  home-manager.users.pagu = {
    programs.yazi = {
      enable = true;
      settings.manager = {
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
      };
      yaziPlugins = {
        enable = true;
        plugins = {
          exifaudio.enable = true;
          full-border.enable = true;
          mediainfo.enable = true;
          no-status.enable = true;
          ouch.enable = true;
          rich-preview.enable = true;
          starship.enable = true;
          torrent-preview.enable = true;
        };
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
    imports = [inputs.yazi-plugins.legacyPackages.x86_64-linux.homeManagerModules.default];
  };
}
