_: {
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
                {type = "calendar";}
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
                        (bookmark "Gmail" "https://mail.google.com/mail/u/0")
                        (bookmark "Drive" "https://drive.google.com/drive/u/0/home")
                        (bookmark "Shiori" "https://shio.pagu.cafe")
                        (bookmark "Mealie" "https://meal.pagu.cafe/g/home")
                        (bookmark "Youtube" "https://youtube.com/feed/subscriptions")
                        (bookmark "YT Music" "https://music.youtube.com")
                      ];
                    }
                    {
                      title = "Stuff";
                      links = [
                        (bookmark "Nix Search" "https://search.nixos.org/packages?channel=unstable")
                        (bookmark "HM Search" "https://home-manager-options.extranix.com/?query=&release=master")
                        (bookmark "GitHub" "https://github.com")
                        (bookmark "Tailscale" "https://login.tailscale.com/admin/machines")
                        (bookmark "Cloudflare" "https://dash.cloudflare.com")
                        (bookmark "Placeholder" "http://192.168.178.182:8333")
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
                  in [
                    (service "Jellyfin" "http://192.168.178.182:8096" "si:jellyfin")
                    (service "Navidrome" "http://192.168.178.182:8098" "si:soundcloud")
                    (service "FreshRSS" "https://frss.pagu.cafe" "si:rss")
                    (service "qBittorrent" "http://192.168.178.182:8077" "si:qbittorrent")
                    (service "Immich" "http://192.168.178.182:3001" "si:immich")
                    (service "Vaultwarden" "https://wrdn.pagu.cafe" "si:vaultwarden")
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
