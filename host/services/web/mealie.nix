{
  config,
  nginxlib,
  ...
}: {
  services = let
    port = 9000;
  in {
    mealie = {
      enable = true;
      settings = {
        ALLOW_SIGNUP = true;
        BASE_URL = "meal.${config.networking.domain}";
        TZ = "NZ";
      };
      inherit port;
    };
    nginx = nginxlib.host "meal" port "" "";
  };
  fileSystems."/var/lib/private/mealie" = {
    device = "/storage/mealie";
    options = [ "bind" ];
  };
}
