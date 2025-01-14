{
  inputs,
  lib,
  ...
}: {
  imports = [ inputs.hosts.nixosModule ];
  networking = {
    hostName = "rin";
    hostId = "6f257938";
    stevenBlackHosts = {
      enable = true;
      blockFakenews = true;
      blockGambling = true;
    };
    networkmanager = {
      enable = true;
      plugins = lib.mkForce [];
      wifi.backend = "iwd";
    };
    wireless.iwd.enable = true;
    enableIPv6 = false;
    nameservers = [ "1.0.0.1" "1.1.1.1" ];
  };
  users.users.pagu.extraGroups = [ "networkmanager" ];
}
