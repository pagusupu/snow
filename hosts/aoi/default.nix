{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    flac
    downsampler-threaded
    hugo
  ];
  networking.firewall.allowedTCPPorts = [1313];

  system.stateVersion = "23.11";
  home-manager.users.pagu.home.stateVersion = "23.05";

  imports = builtins.concatMap (x:
    builtins.filter (lib.hasSuffix ".nix")
    (map toString (lib.filesystem.listFilesRecursive x))) [
    ./config
    ./services
  ];
}
