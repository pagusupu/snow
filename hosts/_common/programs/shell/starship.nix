_: {
  home-manager.users.pagu = {
    programs.starship = {
      enable = true;
      settings = let
        overlay = "#26233a";
        love = "#eb6f92";
        gold = "#f6c177";
        rose = "#ebbcba";
        pine = "#31748f";
        iris = "#c4a7e7";
      in {
        format = ''
          [$username[@](bg:${overlay} ${rose})$hostname $directory $git_branch$fill $time]($style)
          $character
        '';
        character = {
          error_symbol = "[󰴈 ~>](${love})";
          success_symbol = "[󰴈 ~>](${iris})";
        };
        directory = {
          format = "[](${overlay})[ $path ]($style)[](${overlay})";
          read_only = " ";
          style = "bg:${overlay} ${pine}";
          truncation_length = 3;
          truncation_symbol = "../";
        };
        fill = {
          style = "${overlay}";
          symbol = " ";
        };
        git_branch = {
          format = "[](${overlay})[ $symbol $branch ]($style)[](${overlay})";
          style = "bg:${overlay} ${iris}";
          symbol = "";
        };
        hostname = {
          format = "[$hostname ](bg:${overlay} ${gold})[](${overlay})[$ssh_symbol]($style)";
          ssh_symbol = " [](${overlay})[  ](bg:${overlay} ${love})[](${overlay})";
          style = "";
          ssh_only = false;
        };
        time = {
          disabled = false;
          format = "[](${overlay})[ $time ]($style)[ ](${overlay})";
          style = "bg:${overlay} ${rose}";
          time_format = "%I:%M%P";
          use_12hr = true;
        };
        username = {
          format = "[](${overlay})[ $user]($style)";
          style_root = "bg:${overlay} ${love}";
          style_user = "bg:${overlay} ${gold}";
          show_always = true;
        };
        add_newline = false;
      };
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
