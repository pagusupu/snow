_: {
  hardware.bluetooth = {
    enable = true;
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
      KernelExperimental = true;
      JustWorksRepairing = "always";
    };
  };
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
    printing.enable = true;
  };
  home-manager.users.pagu = {
    xdg = {
      enable = true;
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
