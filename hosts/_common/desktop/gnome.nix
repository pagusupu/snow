{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
    displayManager.defaultSession = "gnome";
  };

  environment = {
    systemPackages = with pkgs;
      [
        evince
        gnome-calculator
        gnome-tweaks
        loupe
        nautilus
        seahorse
        sushi
      ]
      ++ (with pkgs.gnomeExtensions; [
        appindicator
        fullscreen-avoider
      ]);
    gnome.excludePackages = with pkgs; [gnome-tour];
  };
  services = {
    gnome.core-utilities.enable = false;
    xserver.excludePackages = [pkgs.xterm];
  };

  boot = {
    initrd = {
      systemd = {
        enable = true;
        services = {
          "autovt@tty1".enable = false;
          "getty@tty1".enable = false;
          systemd-udev-settle.enable = false;
        };
        network.wait-online.enable = false;
      };
      verbose = true;
    };
    plymouth.enable = true;
  };
}
