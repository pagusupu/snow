{
  inputs,
  pkgs,
  ...
}: {
  imports = [ inputs.catppuccin.nixosModules.catppuccin ];
  home-manager.users.pagu = {
    imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];
    gtk = {
      enable = true;
      theme = {
        name = "Catppuccin-Dark-Frappe";
        package = pkgs.magnetic-catppuccin-gtk.override {
          accent = [ "pink" ];
          tweaks = [ "frappe" ];
        };
      };
      iconTheme = {
        name = "Breeze-Dark";
        package = pkgs.kdePackages.breeze-icons;
      };
    };
    qt = {
      enable = true;
      platformTheme = {
        name = "kde";
        package = pkgs.catppuccin-kde;
      };
      style = {
        name = "Catppuccin-Frappe-Mauve";
        package = pkgs.catppuccin-kde;
      };
    };
    home.pointerCursor = {
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
    catppuccin = {
      enable = true;
      flavor = "frappe";
      btop.enable = false;
      gtk.enable = false;
      nvim.enable = false;
      starship.enable = false;
      yazi.enable = false;
    };
  };
  catppuccin = {
    enable = true;
    flavor = "frappe";
    sddm.font = "Nunito";
  };
  programs.dconf.enable = true;
}
