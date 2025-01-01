{
  config,
  lib,
  cutelib,
  nginxlib,
  ...
}: {
  options.cute.services.web.linkding = cutelib.mkEnable;
  config = let
    port = 9090;
  in
    lib.mkIf config.cute.services.web.linkding {
      virtualisation.oci-containers.containers."linkding" = {
        image = "sissbruecker/linkding:latest";
        ports = [ "${builtins.toString port}:9090" ];
        volumes = [ "/storage/linkding/:/etc/linkding/data" ];
        environment = {
          LD_SUPERUSER_NAME = "pagu";
          LD_SUPERUSER_PASSWORD = "changeme"; # initial
        };
      };
      services.nginx = nginxlib.host "link" port "" "";
    };
}
