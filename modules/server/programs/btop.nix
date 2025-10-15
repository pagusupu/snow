_: {
  home-manager.users.pagu = {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
        theme_background = false;
        proc_sorting = "name";
        proc_tree = true;
        proc_left = true;
        proc_filter_kernel = true;
        show_io_stat = false;
        show_battery = false;
      };
    };
  };
}
