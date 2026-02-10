{
  config,
  nginxlib,
  pkgs,
  inputs,
  ...
}: {
  services = let
    port = 8098;
  in {
    navidrome = {
      # https://github.com/NixOS/nixpkgs/issues/481611
      package = inputs.unstable.legacyPackages.${pkgs.system}.navidrome;

      enable = true;
      openFirewall = true;
      settings = let
        p = "/storage/navidrome/";
      in {
        CacheFolder = p + "cache";
        DataFolder = p + "data";
        MusicFolder = p + "music";

        Address = "0.0.0.0";
        Port = port;

        AutoImportPlaylists = false;
        DefaultTheme = "Auto";
        EnableExternalServices = false;
        EnableMediaFileCoverArt = false;
        EnableSharing = true;
        EnableStarRating = false;
        EnableTranscodingConfig = true;
        IgnoredArticles = "";
        Scanner.PurgeMissing = "always";
        SessionTimeout = "96h";
        ShareURL = "https://navi.${config.networking.domain}";
        UIWelcomeMessage = "";
      };
    };
    nginx = nginxlib.host "navi" port true null;
  };
}
