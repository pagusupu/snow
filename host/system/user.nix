{
  inputs,
  config,
  ...
}: {
  imports = [ inputs.agenix.nixosModules.default ];
  age = {
    secrets.user = {
      file = ../../parts/secrets/user.age;
      owner = "pagu";
    };
    identityPaths = [ "/etc/ssh/${config.networking.hostName}_ed25519_key" ];
  };
  users.users.pagu = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    uid = 1000;
    hashedPasswordFile = config.age.secrets.user.path;
  };
}
