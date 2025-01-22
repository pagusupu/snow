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
      iconTheme.name = "breeze-dark";
      # hm and kde keep overriding each other
      # im aware how stupid this is
      gtk2.extraConfig = ''
        gtk-theme-name="catppuccin-frappe-mauve-standard+default"
        gtk-cursor-theme-size=24
        gtk-cursor-theme-name="catppuccin-frappe-dark-cursors"
        gtk-icon-theme-name="breeze-dark"
        gtk-cursor-theme-name = "catppuccin-frappe-dark-cursors"
        gtk-cursor-theme-size = 24
        gtk-icon-theme-name = "breeze-dark"
        gtk-theme-name = "catppuccin-frappe-mauve-standard+default"
        gtk-enable-animations=1
        gtk-primary-button-warps-slider=1
        gtk-toolbar-style=3
        gtk-menu-images=1
        gtk-button-images=1
        gtk-sound-theme-name="ocean"
        gtk-font-name="Nunito [NeWT],  10"
      '';
    };
    home.pointerCursor = {
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
    catppuccin = {
      cursors = {
        enable = true;
        accent = "dark";
      };
      gtk = {
        enable = true;
        icon.enable = false;
      };
      fish.enable = true;
      mpv.enable = true;
      flavor = "frappe";
    };
    home.packages = [ pkgs.catppuccin-kde ];
  };
  catppuccin = {
    enable = true;
    flavor = "frappe";
  };
  programs.dconf.enable = true;
}
