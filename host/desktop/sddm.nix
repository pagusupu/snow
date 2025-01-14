{cutelib, ...}: {
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    defaultSession = "plasma";
  };
  catppuccin.sddm = {
    background = cutelib.wallpaper;
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
