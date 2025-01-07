{
  inputs,
  lib,
  ...
}: {
  imports = [ inputs.hosts.nixosModule ];
  /*
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
  */
  networking = lib.mkMerge [
    {
      hostName = "rin";
      hostId = "6f257938";
      stevenBlackHosts = {
        enable = true;
        blockFakenews = true;
        blockGambling = true;
      };
      enableIPv6 = false;
      nameservers = [ "1.0.0.1" "1.1.1.1" ];
      useDHCP = false;
    }
    {
      networkmanager = {
        enable = true;
        plugins = lib.mkForce [];
        wifi.backend = "iwd";
      };
      wireless.iwd.enable = true;
    }
  ];
  users.users.pagu.extraGroups = [ "networkmanager" ];
}
