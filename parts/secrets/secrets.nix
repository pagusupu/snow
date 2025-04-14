let
  aoi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIExuEEnRUnoo1qZVnvLUtvXqCcBd7DcDJkohVCg0Qbij";
in {
  "freshrss.age".publicKeys = [aoi];
  "shiori.age".publicKeys = [aoi];
  "tailscale.age".publicKeys = [aoi];
}
