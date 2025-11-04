{
  inputs,
  pkgs,
  config,
  ...
}: {
  services.tailscale.extraUpFlags = ["--ssh"];
  networking.domain = "pagu.cafe";

  environment.systemPackages = [inputs.agenix.packages.${pkgs.system}.default];
  age.identityPaths = ["/etc/ssh/${config.networking.hostName}_ed25519_key"];

  home-manager.users.pagu = {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
        theme_background = false;
        proc_sorting = "name";
        proc_tree = true;
        proc_left = true;
        proc_filter_kernel = true;
        show_io_stat = false;
        show_battery = false;
      };
    };
  };

  _module.args.nginxlib = rec {
    SSL = {
      enableACME = true;
      forceSSL = true;
    };
    host = subdomain: port: proxyWebsockets: extraConfig: {
      virtualHosts."${subdomain}.${config.networking.domain}" =
        {
          locations."/" = {
            proxyPass = "http://localhost:${builtins.toString port}";
            inherit proxyWebsockets;
            extraConfig =
              if extraConfig != null
              then extraConfig
              else "";
          };
        }
        // SSL;
    };
  };
}
