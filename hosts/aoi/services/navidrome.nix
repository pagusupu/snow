{
  config,
  nginxlib,
  pkgs,
  ...
}: {
  services = let
    port = 8098;
  in {
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
  # https://github.com/NixOS/nixpkgs/issues/481611
  nixpkgs.overlays = [
    (self: _super: {
      navidrome = self.callPackage (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/cimm/nixpkgs/71aa374ad541b41e6fccd543c67b6952d2ccafca/pkgs/by-name/na/navidrome/package.nix";
        sha256 = "16mfj85w8d7vzc9pgcgjn7a71z7jywqpdn8igk9zp0hw9dvm9rmq";
      }) {};
    })
  ];
}
