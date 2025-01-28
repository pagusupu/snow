{
  lib,
  nginxlib,
  ...
}:
lib.mkMerge [
  {
    services = {
      jellyfin = {
        enable = true;
        openFirewall = true;
      };
      nginx = nginxlib.host "jlly" 8096 "true" "proxy_buffering off;";
    };
  }
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
]
