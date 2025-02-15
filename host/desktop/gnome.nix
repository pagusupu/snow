{
  pkgs,
  lib,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      excludePackages = [pkgs.xterm];
    };
    gnome.core-utilities.enable = false;
  };
  environment = {
    systemPackages = with pkgs;
      [
        evince
        gnome-calculator
        gnome-system-monitor
        gnome-tweaks
        loupe
        nautilus
        seahorse
        sushi
      ]
      ++ (with pkgs.gnomeExtensions; [
        appindicator
      ]);
    gnome.excludePackages = with pkgs; [gnome-tour];
  };
  home-manager.users.pagu = {
    xdg = {
      enable = true;
      desktopEntries =
        lib.genAttrs [
          "base"
          "calc"
          "draw"
          "impress"
          "math"
          "writer"

          "fish"
          "mpv"
          "yazi"
        ] (n: {
          name = n;
          noDisplay = true;
        });
    };
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
