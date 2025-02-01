{inputs, ...}: {
  programs.nixvim = {
    enable = true;
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    opts = {
      autoindent = true;
      breakindent = true;
      smartindent = true;
      shiftwidth = 2;

      autoread = true;
      backup = false;
      swapfile = false;
      undofile = true;

      background = "dark";
      number = true;
      showmode = false;
      termguicolors = true;
    };
    performance.byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      plugins = true;
    };
    extraConfigVim = ''
      aun PopUp.How-to\ disable\ mouse
      aun PopUp.-1-
    '';
    enableMan = false;
    defaultEditor = true;
    luaLoader.enable = true;
    vimAlias = true;
    withPython3 = false;
    withRuby = false;
  };
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  imports = [ inputs.nixvim.nixosModules.nixvim ];
}
