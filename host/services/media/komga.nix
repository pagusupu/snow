{
  config,
  lib,
  cutelib,
  nginxlib,
  ...
}: {
  options.cute.services.media.komga = cutelib.mkEnable;
  config = lib.mkIf config.cute.services.media.komga {
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
  };
}
