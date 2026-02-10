{config, ...}: {
  services.glance = {
    enable = true;
    openFirewall = true;
    settings = {
      server = {
        port = 8333;
        host = "0.0.0.0";
      };
      pages = [
        {
          columns = [
            {
              widgets = [
                {
                  type = "clock";
                  hour-format = "12h";
                  timezones = let
                    zone = timezone: label: {inherit timezone label;};
                  in [
                    (zone "US/Central" "US/Central")
                    (zone "Europe/London" "London")
                    (zone "Asia/Tokyo" "Tokyo")
                    (zone "Australia/Sydney" "Sydney")
                  ];
                }
                {type = "calendar-legacy";}
              ];
              size = "small";
            }
            {
              widgets = [
                {
                  type = "bookmarks";
                  groups = let
                    bookmark = title: url: {
                      inherit title url;
                      same-tab = true;
                    };
                  in [
                    {
                      title = "Frequent";
                      links = [
                        (bookmark "Shiori" "https://shio.pagu.page")
                        (bookmark "Gmail" "https://mail.google.com/mail/u/0")
                        (bookmark "Drive" "https://drive.google.com/drive/u/0/home")
                        (bookmark "Notes" "https://keep.google.com/u/0")
                        (bookmark "Youtube" "https://youtube.com/feed/subscriptions")
                        (bookmark "YT Music" "https://music.youtube.com")
                      ];
                    }
                    {
                      title = "Stuff";
                      links = [
                        (bookmark "Canvas" "https://canvas.aut.ac.nz/")
                        (bookmark "Nix Search" "https://search.nixos.org/packages?channel=unstable")
                        (bookmark "HM Search" "https://home-manager-options.extranix.com/?query=&release=master")
                        (bookmark "GitHub" "https://github.com")
                        (bookmark "Tailscale" "https://login.tailscale.com/admin/machines")
                        (bookmark "Cloudflare" "https://dash.cloudflare.com")
                      ];
                    }
                  ];
                }
                {
                  type = "monitor";
                  sites = let
                    service = title: url: icon: {
                      inherit title url icon;
                      same-tab = true;
                    };
                    inherit (config.networking) domain;
                  in [
                    (service "Jellyfin" "https://jlly.${domain}" "si:jellyfin")
                    (service "Navidrome" "https://navi.${domain}" "si:soundcloud")
                    (service "FreshRSS" "https://frss.${domain}" "si:rss")
                    (service "qBittorrent" "https://qbit.${domain}" "si:qbittorrent")
                    (service "Immich" "https://pics.${domain}" "si:immich")
                    (service "Vaultwarden" "https://wrdn.${domain}" "si:vaultwarden")
                  ];
                  cache = "1m";
                  title = "Services";
                }
              ];
              size = "full";
            }
          ];
          name = "Home";
          width = "slim";
          hide-desktop-navigation = true;
          center-vertically = true;
        }
      ];
      theme = {
        light = false;
        background-color = "247 22 12";
        primary-color = "267 57 78";
        positive-color = "267 57 78";
        negative-color = "343 76 68";
      };
      branding.hide-footer = true;
    };
  };
}
