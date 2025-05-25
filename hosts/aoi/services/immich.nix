{nginxlib, ...}: let
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
}
