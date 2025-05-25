_: {
  systemd.network = let
    name = "enp37s0";
  in {
    enable = true;
    networks.${name} = {
      enable = true;
      inherit name;
      networkConfig.DHCP = "no";
      address = ["192.168.178.182/24"];
      routes = [{Gateway = "192.168.178.1";}];
    };
  };
}
