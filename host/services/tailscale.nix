{
  config,
  lib,
  cutelib,
  ...
}: {
  options.cute.services.tailscale = cutelib.mkEnable;
  config = lib.mkIf config.cute.services.misc.tailscale {
    services.tailscale = {
      enable = true;
      openFirewall = true;
      authKeyFile = config.age.secrets.tailscale.path;
      useRoutingFeatures = "both";
      extraUpFlags = [ "--accept-risk=" ];
    };
    age.secrets.tailscale.file = ../../parts/secrets/tailscale.age;
  };
}
