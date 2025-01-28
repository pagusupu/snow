_: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        section_separators = {
          left = "";
          right = "";
        };
        component_separators = "";
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "filename" "branch" ];
        lualine_c = [ "" ];
        lualine_x = [ "" ];
        lualine_y = [ "filetype" "progress" ];
        lualine_z = [ "location" ];
      };
      inactive_sections = {
        lualine_a = [ "filename" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
