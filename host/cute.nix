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
        steam = true;
      };
      services.tailscale = true;
    };
  };
  programs.localsend.enable = true;

  home-manager.users.pagu = {
    home = {
      packages = with pkgs; [
        bitwarden-desktop
        cartridges
        feishin
        heroic
        radeontop
        standardnotes
        trayscale
      ];
      #stateVersion = "23.05"; # no touchy
    };
    programs.mpv.enable = true;
  };
  # no touchy
  #system.stateVersion = "23.11";
}
