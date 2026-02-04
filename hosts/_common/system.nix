{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = with inputs; [
    ragenix.nixosModules.default
    hosts.nixosModule
  ];

  documentation = {
    enable = false;
    doc.enable = false;
    info.enable = false;
    nixos.enable = false;
  };
  programs = {
    bash.completion.enable = false;
    command-not-found.enable = false;
    nano.enable = false;
  };
  boot.enableContainers = false;

  networking = {
    domain = "pagu.page";
    stevenBlackHosts = {
      enable = true;
      blockFakenews = true;
      blockGambling = true;
    };
    #enableIPv6 = false;
    #  nameservers = ["1.0.0.1" "1.1.1.1"];
    #  useDHCP = false;
  };

  environment.systemPackages = [inputs.ragenix.packages.${pkgs.system}.default];
  age.identityPaths = ["/etc/ssh/${config.networking.hostName}_ed25519_key"];

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
    hostKeys = [
      {
        path = "/etc/ssh/${config.networking.hostName}_ed25519_key";
        type = "ed25519";
      }
    ];
    knownHosts."github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
  };

  time.timeZone = "NZ";
  i18n.defaultLocale = "en_NZ.UTF-8";

  users.users.pagu = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    uid = 1000;
  };
}
