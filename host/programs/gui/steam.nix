{
  config,
  lib,
  cutelib,
  inputs,
  pkgs,
  ...
}: {
  imports = [ inputs.nix-gaming.nixosModules.platformOptimizations ];
  options.cute.programs.gui.steam = cutelib.mkEnable;
  config = lib.mkIf config.cute.programs.gui.steam {
    programs.steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
        args = [
          "-b"
          "-f"

          "-H 1080"
          "-o 30" # doesnt seem to do anything on plasma
          "-r 144"

          "--backend sdl"
          "--expose-wayland"
        ];
        env = {
          SDL_VIDEODRIVER = "x11";
          WLR_RENDERER = "vulkan";
        };
      };
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      localNetworkGameTransfers.openFirewall = true;
      platformOptimizations.enable = true;
      protontricks.enable = true;
    };
    environment = {
      sessionVariables.WINEDEBUG = "-all";
      systemPackages = [ pkgs.adwsteamgtk ];
    };
    hardware.xone.enable = true;
  };
}
