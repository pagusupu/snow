{inputs, ...}: {
  imports = [inputs.hosts.nixosModule];
  networking = {
    domain = "pagu.cafe";
    hostName = "aoi";
    hostId = "a3b49b22";
    stevenBlackHosts = {
      enable = true;
      blockFakenews = true;
      blockGambling = true;
    };
    enableIPv6 = false;
    nameservers = ["1.0.0.1" "1.1.1.1"];
    useDHCP = false;
  };
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
