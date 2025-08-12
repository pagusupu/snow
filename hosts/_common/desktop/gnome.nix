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
        resources
        sticky-notes
        switcheroo
      ]
      ++ (with pkgs.gnomeExtensions; [
        appindicator
        blur-my-shell
        fullscreen-avoider
        quick-settings-tweaker
        removable-drive-menu
        user-themes
      ]);
    gnome.excludePackages = [pkgs.gnome-tour];
  };
  services = {
    gnome = {
      core-apps.enable = false;
      sushi.enable = true;
    };
    avahi.nssmdns4 = true;
  };

  hardware.bluetooth.settings.General = {
    Enable = "Source,Sink,Media,Socket";
    Experimental = true;
    KernelExperimental = true;
    JustWorksRepairing = "always";
  };

  boot = {
    plymouth.enable = true;
    kernelParams = ["quiet" "splash"];
  };
}
