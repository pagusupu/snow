{
  config,
  nginxlib,
  ...
}: let
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
}
