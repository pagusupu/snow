{
  inputs,
  config,
  ...
}: {
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

  security = {
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = false;
    };
    tpm2.enable = true;
  };

  time = {
    hardwareClockInLocalTime = true;
    timeZone = "NZ";
  };
  i18n.defaultLocale = "en_NZ.UTF-8";

  imports = [inputs.hosts.nixosModule];
  networking = {
    stevenBlackHosts = {
      enable = true;
      blockFakenews = true;
      blockGambling = true;
    };
    enableIPv6 = false;
    nameservers = ["1.0.0.1" "1.1.1.1"];
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
    };
    hostKeys = [
      {
        path = "/etc/ssh/${config.networking.hostName}_ed25519_key";
        type = "ed25519";
      }
    ];
    knownHosts."github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
  };

  users.users.pagu = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    uid = 1000;
  };
}
