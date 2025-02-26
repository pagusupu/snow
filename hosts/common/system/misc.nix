{inputs, ...}: {
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

  time = {
    hardwareClockInLocalTime = true;
    timeZone = "NZ";
  };
  i18n.defaultLocale = "en_NZ.UTF-8";

  imports = [inputs.hosts.nixosModule];
  networking = {
    stevenBlackHosts = {
      enable = true;
      blockFakenews = true;
      blockGambling = true;
    };
    enableIPv6 = false;
    nameservers = ["1.0.0.1" "1.1.1.1"];
  };

  users.users.pagu = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    uid = 1000;
  };
}
