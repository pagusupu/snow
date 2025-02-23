{inputs, ...}: {
  services.pipewire.lowLatency = {
    enable = true;
    quantum = 48;
    rate = 48000;
  };
  imports = [inputs.nix-gaming.nixosModules.pipewireLowLatency];
}
