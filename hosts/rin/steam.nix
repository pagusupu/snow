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
          "-o 30" # doesnt seem to work on plasma or gnome
          "-r 144"

          "--backend wayland"
          "--expose-wayland"
        ];
        env.WLR_RENDERER = "vulkan";
      };
      extraCompatPackages = [pkgs.proton-ge-bin];
      localNetworkGameTransfers.openFirewall = true;
      remotePlay.openFirewall = true;
      platformOptimizations.enable = true;
      protontricks.enable = true;
    };
    gamescope.enable = true;
  };
  environment = {
    sessionVariables.WINEDEBUG = "-all";
    systemPackages = [pkgs.adwsteamgtk];
  };
  imports = [inputs.nix-gaming.nixosModules.platformOptimizations];

  # warframe
  networking.firewall = {
    allowedTCPPortRanges = [
      {
        from = 6695;
        to = 6699;
      }
    ];
    allowedUDPPorts = [4950 4955];
  };
}
