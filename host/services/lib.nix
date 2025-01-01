{config, ...}: {
  _module.args.nginxlib = rec {
    SSL = {
      enableACME = true;
      forceSSL = true;
    };
    host = subdomain: port: websocket: extraConfig: {
      virtualHosts."${subdomain}.${config.networking.domain}" =
        {
          locations."/" = {
            proxyPass = "http://localhost:${builtins.toString port}";
            proxyWebsockets =
              if (websocket == "true")
              then true
              else false;
            inherit extraConfig;
          };
        }
        // SSL;
    };
  };
}
