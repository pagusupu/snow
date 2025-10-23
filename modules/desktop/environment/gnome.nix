{pkgs, ...}: {
  services = {
    displayManager = {
      defaultSession = "gnome";
      gdm.enable = true;
    };
    desktopManager.gnome.enable = true;
  };

  environment = {
    systemPackages = with pkgs;
      [
        celluloid
        gnome-calculator
        gnome-calendar
        gnome-tweaks
        loupe
        nautilus
        papers
        pinta
        resources
        sticky-notes
        switcheroo
      ]
      ++ (with pkgs.gnomeExtensions; [
        appindicator
        dash-to-dock
        fullscreen-avoider
        removable-drive-menu
        user-themes
      ]);
    gnome.excludePackages = [pkgs.gnome-tour];
  };

  services.gnome = {
    core-apps.enable = false;
    sushi.enable = true;
  };

  boot = {
    plymouth.enable = true;
    kernelParams = ["quiet" "splash"];
  };
}
