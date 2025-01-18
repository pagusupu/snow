{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [ inputs.catppuccin.nixosModules.catppuccin ];
  home-manager.users.pagu = {
    imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];
    gtk = {
      enable = true;
      iconTheme.name = "breeze-dark";
      gtk2 = {
        # has been causing weird issues, need to do this not shit
        extraConfig = ''
          gtk-enable-animations=1
          gtk-theme-name="catppuccin-frappe-mauve-standard+default"
          gtk-primary-button-warps-slider=1
          gtk-toolbar-style=3
          gtk-menu-images=1
          gtk-button-images=1
          gtk-cursor-theme-size=24
          gtk-cursor-theme-name="Catppuccin-Frappe-Dark-Cursors"
          gtk-sound-theme-name="ocean"
          gtk-icon-theme-name="breeze-dark"
          gtk-font-name="Nunito [NeWT],  10"
        '';
      };
      cursorTheme = {
        inherit (config.home-manager.users.pagu.home.pointerCursor) name;
        size = 18;
      };
    };
    home.pointerCursor = {
      size = 24;
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
