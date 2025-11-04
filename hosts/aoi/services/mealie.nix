{
  config,
  nginxlib,
  ...
}: let
  port = 9000;
in {
  services = {
    mealie = {
      enable = true;
      settings = {
        ALLOW_SIGNUP = true;
        BASE_URL = "meal.${config.networking.domain}";
        TZ = "NZ";
      };
      inherit port;
    };
    nginx = nginxlib.host "meal" port false null;
  };
  fileSystems."/var/lib/private/mealie" = {
    device = "/storage/mealie";
    options = ["bind"];
  };
}
