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
        user-themes
      ]);
    gnome.excludePackages = with pkgs; [gnome-tour];
  };
  services = {
    gnome.core-apps.enable = false;
    xserver.excludePackages = [pkgs.xterm];
  };

  boot = {
    plymouth.enable = true;
    kernelParams = ["quiet" "splash"];
  };
}
