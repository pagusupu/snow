{
  config,
  lib,
  nginxlib,
  ...
}:
lib.mkMerge [
  (let
    port = 3001;
  in {
    services = {
      immich = {
        enable = true;
        inherit port;
        openFirewall = true;
        host = "0.0.0.0";
        mediaLocation = "/storage/immich";
        environment.TZ = "NZ";
        machine-learning.enable = false;
      };
      nginx = nginxlib.host "pics" port true "client_max_body_size 50000M;";
    };
  })
  (let
    port = 9000;
  in {
    services = {
      mealie = {
        enable = true;
        settings = {
          ALLOW_SIGNUP = true;
          BASE_URL = "meal.${config.networking.domain}";
          TZ = "NZ";
        };
        inherit port;
      };
      nginx = nginxlib.host "meal" port false null;
    };
    fileSystems."/var/lib/private/mealie" = {
      device = "/storage/mealie";
      options = ["bind"];
    };
  })
  (let
    port = 8444;
  in {
    services = {
      shiori = {
        enable = true;
        inherit port;
        environmentFile = config.age.secrets.shiori.path;
      };
      nginx = nginxlib.host "shio" port false null;
    };
    age.secrets.shiori.file = ../../../parts/secrets/shiori.age;
  })
  (let
    port = 8222;
  in {
    services = {
      vaultwarden = {
        enable = true;
        config = {
          DOMAIN = "https://wrdn.${config.networking.domain}";
          ROCKET_PORT = port;
          SIGNUPS_ALLOWED = false;
        };
        backupDir = "/storage/vaultwarden";
      };
      nginx = nginxlib.host "wrdn" port false "proxy_pass_header Authorization;";
    };
  })
]
