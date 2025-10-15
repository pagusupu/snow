{
  config,
  nginxlib,
  ...
}: {
  age.secrets.freshrss = {
    file = ../../../parts/secrets/freshrss.age;
    owner = "freshrss";
  };
  services = let
    domain = "frss.${config.networking.domain}";
  in {
    freshrss = {
      enable = true;
      baseUrl = "https://${domain}";
      dataDir = "/storage/freshrss";
      defaultUser = "pagu";
      passwordFile = config.age.secrets.freshrss.path;
      virtualHost = domain;
    };
    nginx.virtualHosts.${domain} = nginxlib.SSL;
  };
}
