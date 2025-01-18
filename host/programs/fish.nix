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
        ga = "git add -A";
        gc = "git commit -m";
        gp = "git push -u";
        gpo = "git push -u origin";
        gs = "git status -s";
        gsv = "git status -v";
      };
      plugins = [
        {
          name = "autopair";
          inherit (pkgs.fishPlugins.autopair) src;
        }
        {
          name = "pufferfish";
          src = pkgs.fetchFromGitHub {
            owner = "nickeb96";
            repo = "puffer-fish";
            rev = "12d062eae0ad24f4ec20593be845ac30cd4b5923";
            hash = "sha256-2niYj0NLfmVIQguuGTA7RrPIcorJEPkxhH6Dhcy+6Bk=";
          };
        }
      ];
      shellInit = ''
        set fish_color_valid_path cyan
        set -u fish_greeting
      '';
    };
  };
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];
  users.users.pagu.shell = pkgs.fish;
}
