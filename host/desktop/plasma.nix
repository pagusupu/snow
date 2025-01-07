{pkgs, ...}: {
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "plasma";
    };
    desktopManager.plasma6.enable = true;
  };
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    kate
    khelpcenter
    krdp
    kwalletmanager
    plasma-browser-integration
    plasma-workspace-wallpapers
  ];
  initrd = {
    systemd = {
      enable = true;
      services.systemd-udev-settle.enable = false;
      network.wait-online.enable = false;
    };
    verbose = false;
  };
  kernelParams = [ "quiet" "splash" ];
}
