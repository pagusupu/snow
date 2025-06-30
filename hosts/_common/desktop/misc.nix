{lib, ...}: {
  home-manager.users.pagu = {
    xdg = {
      enable = true;
      desktopEntries =
        lib.genAttrs [
          "fish"
          "mpv"
          "yazi"
        ] (n: {
          name = n;
          noDisplay = true;
        });
      userDirs = let
        p = "/home/pagu/";
      in {
        enable = true;
        desktop = p + ".desktop";
        documents = p + "documents";
        download = p + "downloads";
        pictures = p + "pictures";
        videos = p + "pictures/videos";
      };
    };
    home.preferXdgDirectories = true;
  };
}
