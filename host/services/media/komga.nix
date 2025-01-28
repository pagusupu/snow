{nginxlib, ...}: {
  services = let
    port = 8097;
  in {
    komga = {
      enable = true;
      inherit port;
      openFirewall = true;
    };
    nginx = nginxlib.host "kmga" port "" "";
  };
}
