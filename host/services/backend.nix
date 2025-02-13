{lib, ...}:
lib.mkMerge [
  {
    virtualisation = {
      docker = {
        enable = true;
        storageDriver = "btrfs";
      };
      oci-containers.backend = "docker";
    };
  }
  {
    services.nginx = {
      enable = true;
      commonHttpConfig = ''
        real_ip_header CF-Connecting-IP;
        add_header 'Referrer-Policy' 'origin-when-cross-origin';
      '';
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
    };
    networking.firewall.allowedTCPPorts = [80 443 1313];
  }
  {
    security.acme = {
      acceptTerms = true;
      defaults.email = "amce@pagu.cafe";
    };
    users.users.nginx.extraGroups = ["acme"];
  }
]
