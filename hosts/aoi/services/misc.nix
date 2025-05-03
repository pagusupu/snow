{
  config,
  inputs,
  ...
}: {
  services = {
    home-assistant = {
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
    tailscale = {
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
  };
  age.secrets.tailscale.file = ../../../parts/secrets/tailscale.age;

  home-manager = {
    users.pagu.home = {
      homeDirectory = "/home/pagu";
      username = "pagu";
      stateVersion = "23.05";
    };
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
  };
  imports = [inputs.home-manager.nixosModules.home-manager];
}
