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
      knownHosts."github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
    };
    tailscale = {
      enable = true;
      openFirewall = true;
      useRoutingFeatures = "both";
      extraUpFlags = ["--accept-risk="];
    };
  };

  networking = {
    stevenBlackHosts = {
      enable = true;
      blockFakenews = true;
      blockGambling = true;
    };
    enableIPv6 = false;
    nameservers = ["1.0.0.1" "1.1.1.1"];
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
