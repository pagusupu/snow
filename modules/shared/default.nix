{inputs, ...}: {
  imports = [
    ./shell
    ./networking.nix
    ./nix.nix
  ];

  home-manager = {
    users.pagu.home = {
      homeDirectory = "/home/pagu";
      username = "pagu";
    };
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  time.timeZone = "NZ";
  i18n.defaultLocale = "en_NZ.UTF-8";

  users.users.pagu = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    uid = 1000;
  };

  # disable unused stuff
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
  boot.initrd = {
    systemd = {
      enable = true;
      services.systemd-udev-settle.enable = false;
      network.wait-online.enable = false;
    };
    verbose = false;
  };
}
