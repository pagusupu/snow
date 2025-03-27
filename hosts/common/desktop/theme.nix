{pkgs, ...}: {
  home-manager.users.pagu = {
    dconf = {
      enable = true;
      settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
    gtk = {
      enable = true;
      theme = {
        name = "Graphite-Dark";
        package = pkgs.graphite-gtk-theme.override {
          colorVariants = ["dark"];
          themeVariants = ["default"];
          tweaks = ["normal" "black" "rimless"];
          withGrub = true;
        };
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
    home.pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors.overrideAttrs {
        buildPhase = ''
          runHook preBuild

          ctgen configs/normal/x.build.toml -p x11 -d $bitmaps/Bibata-Modern-Classic -n 'Bibata-Modern-Classic'

          runHook postBuild
        '';
      };
      size = 20;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
