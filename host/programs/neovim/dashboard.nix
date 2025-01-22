_: {
  programs.nixvim.plugins.dashboard = {
    enable = true;
    settings = {
      config = {
        center = [
          {
            icon = "  ";
            desc = " new file ";
            key = "n";
            action = "ene | startinsert";
          }
          {
            icon = "  ";
            desc = " yazi ";
            key = "y";
            action = "Yazi";
          }
          {
            icon = "  ";
            desc = " quit ";
            key = "q";
            action = "qa";
          }
        ];
        footer = [ " made with love & nix" ];
      };
      theme = "doom";
    };
  };
}
