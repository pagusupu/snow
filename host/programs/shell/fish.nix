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
        })
        [
          "autopair"
          "fish-bd"
          "fish-you-should-use"
          "puffer"
          "sponge"
        ];
      shellInit = ''
        set fish_color_valid_path cyan
        set -u fish_greeting
      '';
    };
  };
  programs.fish.enable = true;
  environment.shells = [pkgs.fish];
  users.users.pagu.shell = pkgs.fish;
}
