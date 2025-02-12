{
  home-manager.users.pagu = {
    programs.yazi = {
      keymap.manager.prepend_keymap = [
        {
          on = ["C"];
          run = "plugin ouch --args=zip";
          desc = "Compress with ouch";
        }
      ];
      settings = {
        opener.extract = [
          {
            run = ''ouch d -y "$@"'';
            desc = "Extract here with ouch";
            for = "unix";
          }
        ];
        plugin.prepend_previewers = let
          preview = type: {
            mime = "application/${type}";
            run = "ouch";
          };
        in [
          (preview "zip")
          (preview "tar")
          (preview "bzip2")
          (preview "7z-compressed")
          (preview "rar")
          (preview "xz")
        ];
      };
    };
  };
}
