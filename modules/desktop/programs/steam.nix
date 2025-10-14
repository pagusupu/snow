{
  inputs,
  pkgs,
  ...
}: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
        args = [
          "-b"
          "-f"
          "-H 1080"
          "-r 144"
          "--backend wayland"
          "--expose-wayland"
        ];
        env.WLR_RENDERER = "vulkan";
      };
      extraCompatPackages = [pkgs.proton-ge-bin];
      localNetworkGameTransfers.openFirewall = true;
      platformOptimizations.enable = true;
    };
    gamescope.enable = true;
  };
  imports = [inputs.nix-gaming.nixosModules.platformOptimizations];
}
