{config, ...}: {
  services = {
    openssh = {
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
      knownHosts = {
        aoi.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICR4g9u714ldK2AjbqpHUL3CMnBm18EsaTNUqWitzNkN";
        "github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
      };
    };
    tailscale = {
      enable = true;
      openFirewall = true;
      useRoutingFeatures = "both";
      extraUpFlags = ["--accept-risk="];
    };
  };

  networking = {
    stevenblack = {
      enable = true;
      block = ["fakenews" "gambling"];
    };
    enableIPv6 = false;
    nameservers = ["1.1.1.1" "1.0.0.1"];
  };

  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      user = {
        name = "pagu";
        signingKey = "/home/pagu/.ssh/id_ed25519.pub";
      };
      commit.gpgsign = true;
      gpg.format = "ssh";
    };
  };
}
