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
        gnome-calculator
        gnome-calendar
        gnome-tweaks
        loupe
        nautilus
        papers
        pinta
        seahorse
        sushi
      ]
      ++ (with pkgs.gnomeExtensions; [
        appindicator
        blur-my-shell
        fullscreen-avoider
        quick-settings-tweaker
      ]);
    gnome.excludePackages = with pkgs; [gnome-tour];
  };
  services = {
    gnome.core-utilities.enable = false;
    xserver.excludePackages = [pkgs.xterm];
  };

  boot.plymouth.enable = true;

  boot = {
    initrd = {
      systemd = {
        enable = true;
        services = {
          #"autovt@tty1".enable = false;
          #"getty@tty1".enable = false;
          systemd-udev-settle.enable = false;
        };
        network.wait-online.enable = false;
      };
      verbose = false;
    };
    kernelParams = ["quiet" "splash"];
    #plymouth.enable = true;
  };
}
