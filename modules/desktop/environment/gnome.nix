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
        baobab
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
    gnome.excludePackages = with pkgs; [
      gnome-backgrounds
      gnome-color-manager
      gnome-tour
      gnome-user-docs
    ];
  };

  /*
    home-manager.users.pagu.programs.gnome-shell = {
    enable = true;
    extensions = with pkgs.gnomeExtensions; [
      {package = appindicator;}
      {package = dash-to-dock;}
      {package = fullscreen-avoider;}
      {package = removable-drive-menu;}
      {package = user-themes;}
    ];
  };
  */

  services.gnome = {
    core-apps.enable = false;
    core-developer-tools.enable = false;
    games.enable = false;
    sushi.enable = true;
  };

  documentation.nixos.enable = false;

  boot = {
    plymouth.enable = true;
    kernelParams = ["quiet" "splash"];
  };
}
