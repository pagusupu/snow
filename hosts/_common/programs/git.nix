_: {
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      user = {
        name = "pagusupu";
        signingKey = "/home/pagu/.ssh/id_ed25519.pub";
      };
      commit.gpgsign = true;
      gpg.format = "ssh";
    };
  };
}
