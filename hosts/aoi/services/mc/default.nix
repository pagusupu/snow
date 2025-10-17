_: {
  imports = [
    ./pagupack.nix
  ];
  virtualisation = {
    oci-containers.containers."minecraft" = {
      image = "itzg/minecraft-server:stable";
      ports = ["25565:25565"];
      autoStart = false;
      environment = {
        EULA = "true";
        ENABLE_WHITELIST = "true";
        INIT_MEMORY = "8G";
        MAX_MEMORY = "12G";
        SIMULATION_DISTANCE = "6";
        VIEW_DISTANCE = "12";
        ENABLE_AUTOPAUSE = "true";
        MAX_TICK_TIME = "-1";
      };
      volumes = ["/home/pagu/minecraft/modpacks:/modpacks:ro"];
    };
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
    oci-containers.backend = "docker";
  };
}
