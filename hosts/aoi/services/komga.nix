{nginxlib, ...}: let
  port = 8097;
in {
  services = {
    komga = {
      enable = true;
      settings.server = {inherit port;};
      openFirewall = true;
    };
    nginx = nginxlib.host "kmga" port false null;
  };
}
