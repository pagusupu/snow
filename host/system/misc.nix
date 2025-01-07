_: {
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
}
