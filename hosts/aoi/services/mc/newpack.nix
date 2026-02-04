{
  virtualisation.oci-containers.containers."minecraft" = {
    environment = {
      VERSION = "1.21.1";

      TYPE = "MODRINTH";
      MODRINTH_MODPACK = "/modpacks/newpack.mrpack";

      RCON_COMMANDS_STARTUP = "/gamerule playersSleepingPercentage 20";
      DIFFICULTY = "hard";
      MOTD = "if you're reading this you will stub your toe";
    };
    ports = ["24454:24454/udp"]; # vc mod
    volumes = ["/home/pagu/minecraft/servers/bettermc:/data"];
  };
}
