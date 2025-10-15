{nginxlib, ...}: let
  port = 8096;
in {
  services = {
    jellyfin = {
      enable = true;
      openFirewall = true;
    };
    nginx = nginxlib.host "jlly" port true "proxy_buffering off;";
  };
}
