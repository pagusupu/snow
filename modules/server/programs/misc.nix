{
  inputs,
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = [inputs.agenix.packages.${pkgs.system}.default];
  age.identityPaths = ["/etc/ssh/${config.networking.hostName}_ed25519_key"];
}
