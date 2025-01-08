{inputs, ...}: let
  name = "enp37s0";
  ip = "192.168.178.182";
in {
  imports = [ inputs.hosts.nixosModule ];

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
    nameservers = [ "1.0.0.1" "1.1.1.1" ];
    useDHCP = false;
  };
  systemd.network = {
    enable = true;
    networks.${name} = {
      enable = true;
      inherit name;
      networkConfig.DHCP = "no";
      address = [ "${ip}/24" ];
      routes = [ { Gateway = "192.168.178.1"; } ];
    };
  };
}
