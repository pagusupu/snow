{pkgs, ...}: {
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    defaultSession = "plasma";
  };
  catppuccin.sddm = {
    background = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/orangci/walls-catppuccin-mocha/master/soft-rose.jpg";
      hash = "sha256-/ep92ydn2yWbQHAXyMT9VaBvPFviXJ+qOqXwAbrj8qM=";
    };
    font = "nunito";
    fontSize = "12";
  };
  boot = {
    initrd = {
      systemd = {
        enable = true;
        services.systemd-udev-settle.enable = false;
        network.wait-online.enable = false;
      };
      verbose = false;
    };
    kernelParams = [ "quiet" ];
  };
}
