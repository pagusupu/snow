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

        jj = "javac $argv.java && java $argv";
        cc = "gcc $argv.c -o $argv.out && ./$argv.out";
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
        fish_config theme choose "rose-pine"
      '';
    };
    home.file."fish-rose-pine" = {
      source = pkgs.fetchurl {
        url = "https://github.com/rose-pine/fish/raw/refs/heads/main/themes/Ros%C3%A9%20Pine.theme";
        hash = "sha256-dpAIN45Nw18mbdomNIUqjlXCDf907xmtwarkKM4323M=";
      };
      target = ".config/fish/themes/rose-pine.theme";
    };
  };
  programs.fish.enable = true;
  environment.shells = [pkgs.fish];
  users.users.pagu.shell = pkgs.fish;
}
