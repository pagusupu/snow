{nginxlib, ...}: let
  port = 8097;
in {
  services = {
    komga = {
      enable = true;
      settings = {inherit port;};
      openFirewall = true;
    };
    nginx = nginxlib.host "kmga" port false null;
  };
}
