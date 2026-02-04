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
  };
  networking = {
    firewall.enable = true;
    useNetworkd = true;
    useDHCP = false;
    enableIPv6 = false;
    nameservers = ["1.1.1.1" "1.0.0.1"];
  };
}
