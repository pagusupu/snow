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
      platformTheme.name = "adwaita";
      style.name = "adwaita-dark";
    };
    home = {
      packages = let
        shell = pkgs.marble-shell-theme.override {
          colors = ["purple"];
          additionalInstallationTweaks = [
            "--mode=dark"
            #"--floating-panel"
          ];
        };
      in [
        shell
        pkgs.gdm-settings
      ];
      pointerCursor = {
        name = "BreezeX-RosePine-Linux";
        package = pkgs.rose-pine-cursor;
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };
    };
  };
}
