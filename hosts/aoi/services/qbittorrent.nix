{
  config,
  nginxlib,
  pkgs,
  inputs,
  ...
}: {
  imports = ["${inputs.qbit}/nixos/modules/services/torrent/qbittorrent.nix"];
  services = let
    port = 8077;
  in {
    qbittorrent = {
      enable = true;
      package = inputs.qbit.legacyPackages.${pkgs.system}.qbittorrent-nox;
      openFirewall = true;
      webuiPort = port;
      torrentingPort = 43862;

      serverConfig = let
        p = "/storage/qbit/torrents/";
      in {
        LegalNotice.Accepted = true;
        BitTorrent.Session = {
          DefaultSavePath = p + "misc/";
          TorrentExportDirectory = p + "sources/";
          TempPath = p + "incomplete/";
          TempPathEnabled = true;

          QueueingSystemEnabled = true;
          IgnoreSlowTorrentsForQueueing = true;

          SlowTorrentsDownloadRate = 40;
          SlowTorrentsUploadRate = 40;
          GlobalDLSpeedLimit = 4500;
          GlobalUPSpeedLimit = 5000;

          MaxActiveCheckingTorrents = 2;
          MaxActiveDownloads = 3;
          MaxActiveUploads = 500;
          MaxActiveTorrents = 505;
          MaxUploads = 500;
          MaxConnections = 700;
        };
        Preferences = {
          General = {
            DeleteTorrentsFilesAsDefault = true;
            Locale = "en";
          };
          WebUI = {
            AlternativeUIEnabled = true;
            RootFolder = "${pkgs.fetchzip {
              url = "https://github.com/VueTorrent/VueTorrent/releases/download/v2.26.0/vuetorrent.zip";
              hash = "sha256-EFVzsr/OZ/QMJ+NN3kDkmIk6FCCnqgK6DgsLWNonspU=";
            }}";

            Username = "pagu";
            Password_PBKDF2 = ''"@ByteArray(kZipcTwDuigp5wDRkynNQA==:roLYJRl9n/jcGRTXzgont6GAsBm7Bu7LGfrUfB7QcQqgQRSOLNvBs9YrC6h8nMgN/4e4dDETmAQGF16S+zBD5Q==)"'';

            ReverseProxySupportEnabled = true;
            TrustedReverseProxiesList = "qbit.${config.networking.domain}";
          };
        };
      };
    };
    nginx = nginxlib.host "qbit" port false null;
  };
}
