{lib, ...}: {
  imports = builtins.concatMap (x:
    builtins.filter (lib.hasSuffix ".nix")
    (map toString (lib.filesystem.listFilesRecursive x))) [
    ./config
    ./services
  ];
  system.stateVersion = "23.11";
  home-manager.users.pagu.home.stateVersion = "23.05";
}
