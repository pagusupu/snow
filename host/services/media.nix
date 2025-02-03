{
  config,
  lib,
  nginxlib,
  ...
}:
lib.mkMerge [
  {
    age.secrets.freshrss = {
      file = ../../parts/secrets/freshrss.age;
      owner = "freshrss";
    };
    services = let
      domain = "frss.${config.networking.domain}";
    in {
      freshrss = {
        enable = true;
        baseUrl = "https://${domain}";
        dataDir = "/storage/freshrss";
        defaultUser = "pagu";
        passwordFile = config.age.secrets.freshrss.path;
        virtualHost = domain;
      };
      nginx.virtualHosts.${domain} = nginxlib.SSL;
    };
  }
  (let
    port = 8096;
  in {
    services = {
      jellyfin = {
        enable = true;
        openFirewall = true;
      };
      nginx = nginxlib.host "jlly" port "true" "proxy_buffering off;";
    };
  })
  (let
    port = 5096;
  in {
    services = {
      jellyseerr = {
        enable = true;
        inherit port;
        openFirewall = true;
      };
      nginx = nginxlib.host "seer" port "" "";
    };
  })
  (let
    port = 8097;
  in {
    services = {
      komga = {
        enable = true;
        inherit port;
        openFirewall = true;
      };
      nginx = nginxlib.host "kmga" port "" "";
    };
  })
]
