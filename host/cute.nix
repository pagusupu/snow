_: {
  cute = {
    programs = {
      btop = true;
      cli-tools = true;
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
  networking = {
    domain = "pagu.cafe";
    hostName = "aoi";
    hostId = "a3b49b22";
  };
  # no touchy
  home-manager.users.pagu.home.stateVersion = "23.05";
  system.stateVersion = "23.11";
}
