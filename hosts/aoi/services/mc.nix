_: {
  virtualisation = {
    oci-containers.containers."minecraft" = {
      image = "itzg/minecraft-server:stable";
      autoStart = false;
      ports = [
        "25565:25565"
        # "24454:24454/udp" # vc mod
      ];
      environment = {
        EULA = "true";
        MOTD = ":3";
        DIFFICULTY = "hard";
        ENABLE_WHITELIST = "true";

        /*
        VERSION = "1.21.1";
        TYPE = "MODRINTH";
        MODRINTH_MODPACK = "/modpacks/pagupack.mrpack";
        RCON_COMMANDS_STARTUP = "/gamerule playersSleepingPercentage 20";
        */

        /*
        VERSION = "1.20.1";
        TYPE = "MODRINTH";
        MODRINTH_MODPACK = "prominence-2-fabric";
        LEVEL = "prominence";
        */

        INIT_MEMORY = "8G";
        MAX_MEMORY = "12G";
        SIMULATION_DISTANCE = "6";
        VIEW_DISTANCE = "12";
        ENABLE_AUTOPAUSE = "true";
        MAX_TICK_TIME = "-1";
      };
      volumes = let
        mc = "/home/pagu/minecraft";
      in [
        # "${mc}/servers/pagupack:/data"
        # "${mc}/servers/prominence:/data"
        "${mc}/modpacks:/modpacks:ro"
      ];
    };
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
    oci-containers.backend = "docker";
  };
}
