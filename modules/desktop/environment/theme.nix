{pkgs, ...}: {
  home-manager.users.pagu = {
    dconf = {
      enable = true;
      settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
    gtk = {
      enable = true;
      theme = {
        name = "rose-pine";
        package = pkgs.rose-pine-gtk-theme;
      };
      iconTheme = {
        name = "MoreWaita";
        package = pkgs.morewaita-icon-theme;
      };
    };
    qt = {
      enable = true;
      platformTheme.name = "gtk";
    };
    home = {
      pointerCursor = {
        name = "BreezeX-RosePine-Linux";
        package = pkgs.rose-pine-cursor;
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };
      packages = let
        shell = pkgs.marble-shell-theme.override {
          additionalInstallationTweaks = ["--mode=dark"];
          colors = ["purple"];
        };
      in [shell];
    };
  };
}
