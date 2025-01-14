{
  inputs,
  config,
  ...
}: {
  documentation = {
    enable = false;
    doc.enable = false;
    info.enable = false;
    nixos.enable = false;
  };
  programs = {
    bash.completion.enable = false;
    command-not-found.enable = false;
    nano.enable = false;
  };
  boot.enableContainers = false;

  security = {
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = false;
    };
    tpm2.enable = true;
  };

  imports = [ inputs.agenix.nixosModules.default ];
  age.identityPaths = [ "/etc/ssh/${config.networking.hostName}_ed25519_key" ];

  time = {
    hardwareClockInLocalTime = true;
    timeZone = "NZ";
  };
  i18n.defaultLocale = "en_NZ.UTF-8";

  users.users.pagu = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    uid = 1000;
  };
}
