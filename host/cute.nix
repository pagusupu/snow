_: {
  cute = {
    programs = {
      btop = true;
      cli.tools = true;
      fish = true;
      nvim = true;
      starship = true;
      yazi = true;
    };
    services = {
      media = {
        freshrss = true;
        jellyfin = true;
        komga = true;
        navidrome = true;
        qbittorrent = true;
      };
      misc = {
        blocky = true;
        home-assistant = true;
        tailscale = true;
      };
      web = {
        glance = true;
        immich = true;
        linkding = true;
        mealie = true;
        vaultwarden = true;
      };
    };
  };
  # no touchy
  home-manager.users.pagu.home.stateVersion = "23.05";
  system.stateVersion = "23.11";
}
