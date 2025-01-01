{config, ...}: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
    hostKeys = [
      {
        path = "/etc/ssh/${config.networking.hostName}_ed25519_key";
        type = "ed25519";
      }
    ];
    knownHosts."github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
  };
  programs.ssh.extraConfig = "SetEnv TERM=xterm-256color";
}
