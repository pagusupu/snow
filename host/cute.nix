{pkgs, ...}: {
  cute = {
    programs = {
      cli = {
        btop = true;
        fish = true;
        nvim = true;
        starship = true;
        tools = true;
        yazi = true;
      };
      gui = {
        aagl = true;
        discord = true;
        floorp = true;
        gamemode = true;
        steam = true;
      };
    };
    services.tailscale = true;
  };
  programs.localsend.enable = true;

  home-manager.users.pagu = {
    home = {
      packages = with pkgs; [
        bitwarden-desktop
        cartridges
        feishin
        heroic
        protonmail-desktop
        radeontop
        standardnotes
        trayscale
      ];
      stateVersion = "24.11"; # no touchy
    };
    programs.mpv.enable = true;
  };
  system.stateVersion = "24.11"; # no touchy
}
