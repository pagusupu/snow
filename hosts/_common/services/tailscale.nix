{config, ...}: {
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
}
