{lib, ...}: {
  imports = builtins.concatMap (x:
    builtins.filter (lib.hasSuffix ".nix")
    (map toString (lib.filesystem.listFilesRecursive x))) [
    ./environment
    ./programs
  ];
}
