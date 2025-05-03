{pkgs, ...}: {
  home-manager.users.pagu = {
    programs.fish = {
      enable = true;
      functions = {
        nr = "nix run nixpkgs#$argv[1] -- $argv[2]";
        ns = "nix shell nixpkgs#$argv";
      };
      shellAliases = {
        cat = "bat";
        cd = "z";
        grep = "grep --color=auto";
        ls = "eza";
        nf = "nix flake";
        rm = "rip";
        ga = "git add -A";
        gc = "git commit -m";
        gp = "git push -u origin";
        gs = "git status -s";
        gsv = "git status -v";
      };
      plugins =
        map (name: {
          inherit name;
          inherit (pkgs.fishPlugins.${name}) src;
        }) [
          "autopair"
          "fish-bd"
          "fish-you-should-use"
          "puffer"
          "sponge"
        ];
      shellInit = ''
        set -u fish_greeting

        set fish_color_valid_path yellow
        set fish_color_autosuggestion brblack
        set fish_color_param blue
        set fish_color_option green
        set fish_color_command magenta
        set fish_color_error red
      '';
    };
  };
  programs.fish.enable = true;
  environment.shells = [pkgs.fish];
  users.users.pagu.shell = pkgs.fish;
}
