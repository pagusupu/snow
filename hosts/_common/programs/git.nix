_: {
  programs.git = {
    enable = true;
    config = {
      github.user = "pagusupu";
      init.defaultBranch = "main";
      user = {
        name = "pagu";
        signingKey = "/home/pagu/.ssh/id_ed25519.pub";
      };
      commit.gpgsign = true;
      gpg.format = "ssh";
    };
  };
}
