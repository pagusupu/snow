{
  lib,
  inputs,
  ...
}: (lib.mkMerge [
  {
    nix = {
      settings = {
        auto-allocate-uids = true;
        auto-optimise-store = true;
        builders-use-substitutes = true;
        use-xdg-base-directories = true;
        warn-dirty = false;
        experimental-features = [
          "auto-allocate-uids"
          "flakes"
          "nix-command"
          "no-url-literals"
        ];
        substituters = [ "https://cache.nixos.org?priority=10" ];
        allowed-users = [ "@wheel" ];
        trusted-users = [ "pagu" ];
      };
      optimise.automatic = true;
    };
    nixpkgs = {
      config.allowUnfree = true;
      overlays = [ inputs.self.overlays.default ];
    };
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 5 --keep-since 3d";
      };
      flake = "/home/pagu/snow/";
    };
    system = {
      stateVersion = "23.11";
      tools.nixos-option.enable = false; # lix
    };
  }
  {
    nix = {
      channel.enable = false;
      nixPath = [ "nixpkgs=/etc/nix/inputs/nixpkgs" ];
      settings.nix-path = [ "nixpkgs=flake:nixpkgs" ];
      registry.nixpkgs.flake = inputs.nixpkgs;
    };
    environment.etc."nix/inputs/nixpkgs".source = inputs.nixpkgs.outPath;
  }
])
