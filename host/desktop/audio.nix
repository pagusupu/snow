{inputs, ...}: {
  imports = [ inputs.nix-gaming.nixosModules.pipewireLowLatency ];
  services.pipewire = {
    enable = true;
    lowLatency = {
      enable = true;
      quantum = 48;
      rate = 48000;
    };
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
}