_: {
  # is this a gui program? no, am i stupid? yes
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        desiredgov = "performance";
        renice = 10;
      };
      gpu = {
        amd_performance_level = "high";
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 1;
      };
    };
  };
  users.users.pagu.extraGroups = [ "gamemode" ];
}
