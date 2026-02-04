{
  config,
  nginxlib,
  pkgs,
  ...
}: {
  services = let
    port = 8077;
  in {
    qbittorrent = {
      enable = true;
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

          SlowTorrentsDownloadRate = 100;
          SlowTorrentsUploadRate = 100;
          GlobalDLSpeedLimit = 0; # unlimited
          GlobalUPSpeedLimit = 10000;

          MaxActiveCheckingTorrents = 2;
          MaxActiveDownloads = 3;
          MaxActiveUploads = 1000;
          MaxActiveTorrents = 1005;
          MaxUploads = 1000;
          MaxConnections = 1000;
        };
        Preferences = {
          General = {
            DeleteTorrentsFilesAsDefault = true;
            Locale = "en";
          };
          WebUI = {
            AlternativeUIEnabled = true;
            RootFolder = "${pkgs.vuetorrent}/share/vuetorrent";

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
