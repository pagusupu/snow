{pkgs, ...}: {
  home-manager.users.pagu = {
    gtk = {
      enable = true;
      theme = {
        name = "Adwaita";
        package = pkgs.gnome-themes-extra;
      };
      iconTheme = {
        name = "MoreWaita";
        package = pkgs.morewaita-icon-theme;
      };
      colorScheme = "dark";
    };
    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "adwaita-dark";
    };
    home = {
      pointerCursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 20;
        gtk.enable = true;
        x11.enable = true;
      };
      packages = [
        (pkgs.marble-shell-theme.override {
          additionalInstallationTweaks = ["--mode=dark" "-O"];
          colors = ["blue"];
        })
      ];
    };
    /*
      programs.gnome-shell.theme = {
      name = "Marble-blue-dark";
      package = pkgs.marble-shell-theme.override {
        additionalInstallationTweaks = ["--mode=dark" "-O"];
        colors = ["blue"];
      };
    };
    */
  };
}
