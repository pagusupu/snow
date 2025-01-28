{
  config,
  lib,
  nginxlib,
  pkgs,
  ...
}:
lib.mkMerge [
  (let
    port = 9180;
  in {
    virtualisation.oci-containers.containers."feishin" = {
      image = "ghcr.io/jeffvli/feishin:0.12.1";
      ports = [ "${builtins.toString port}:9180" ];
    };
    services.nginx = nginxlib.host "fish" port "" "";
  })
  (let
    port = 8098;
  in {
    services = {
      navidrome = {
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
          IgnoredArticles = "";
          SessionTimeout = "96h";
          ShareURL = "https://navi.${config.networking.domain}";
          UIWelcomeMessage = "";
        };
      };
      nginx = nginxlib.host "navi" port "true" "";
    };
    environment.systemPackages = with pkgs; [
      downsampler-threaded
      flac
      streamrip
      sox
    ];
  })
]
