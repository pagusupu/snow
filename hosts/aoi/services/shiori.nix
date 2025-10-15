{
  config,
  nginxlib,
  ...
}: let
  port = 8444;
in {
  services = {
    shiori = {
      enable = true;
      inherit port;
      environmentFile = config.age.secrets.shiori.path;
    };
    nginx = nginxlib.host "shio" port false null;
  };
  age.secrets.shiori.file = ../../../parts/secrets/shiori.age;
}
