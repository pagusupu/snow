_: {
  networking = let
    name = "enp37s0";
  in {
    interfaces.${name} = {
      inherit name;
      useDHCP = false;
      ipv4 = {
        addresses = [
          {
            address = "192.168.178.182";
            prefixLength = 24;
          }
        ];
        routes = [{address = "192.168.178.1";}];
      };
    };
    hostName = "aoi";
    hostId = "a3b49b22";
  };
  system.stateVersion = "23.11";
  home-manager.users.pagu.home.stateVersion = "23.05";
}
