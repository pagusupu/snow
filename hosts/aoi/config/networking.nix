_: {
  systemd.network = let
    name = "enp37s0";
  in {
    enable = true;
    networks.${name} = {
      enable = true;
      inherit name;
      dns = ["1.1.1.1" "1.0.0.1"];
      address = ["192.168.1.3/24"];
      routes = [{Gateway = "192.168.1.1";}];
    };
    hostName = "aoi";
    hostId = "a3b49b22";
  };
  networking = {
    enableIPv6 = false;
    firewall.enable = true;
    useDHCP = false;
    useNetworkd = true;
    nameservers = ["1.1.1.1" "1.0.0.1"];
  };
  services.tailscale.extraUpFlags = [
    "--advertise-exit-node"
    "--exit-node-allow-lan-access"
  ];
}
