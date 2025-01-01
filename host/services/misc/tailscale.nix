{
  config,
  lib,
  cutelib,
  ...
}: {
  options.cute.services.misc.tailscale = cutelib.mkEnable;
  config = lib.mkIf config.cute.services.misc.tailscale {
    services.tailscale = {
      enable = true;
      openFirewall = true;
      authKeyFile = config.age.secrets.tailscale.path;
      useRoutingFeatures = "both";
      extraUpFlags = [
        "--accept-risk="
        "--advertise-exit-node"
        "--exit-node-allow-lan-access"
        "--ssh"
      ];
    };
    age.secrets.tailscale.file = ../../../parts/secrets/tailscale.age;
  };
}
