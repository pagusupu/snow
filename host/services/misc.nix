{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  {
    services.blocky = {
      enable = true;
      settings = {
        blocking = {
          clientGroupsBlock.default = ["ads"];
          denylists.ads = ["https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts"];
        };
        upstreams.groups.default = [
          "1.0.0.1"
          "1.1.1.1"
        ];
        connectIPVersion = "v4";
        ports.dns = 56;
      };
    };
    networking.firewall = {
      allowedTCPPorts = [56];
      allowedUDPPorts = [56];
    };
    environment.systemPackages = [pkgs.blocky]; # cli
  }
  {
    services.home-assistant = {
      enable = true;
      openFirewall = true;
      config = {
        homeassistant = {
          time_zone = "Pacific/Auckland";
          temperature_unit = "C";
          unit_system = "metric";
        };
        # disable next two for onboarding
        default_config = {};
      };
      extraComponents = [
        "fritz"
        "light"
        "wiz"
      ];
    };
  }
  {
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
    age.secrets.tailscale.file = ../../parts/secrets/tailscale.age;
  }
]
