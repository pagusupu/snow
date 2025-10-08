{inputs, ...}: {
  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = "both";
    extraUpFlags = ["--accept-risk="];
  };
  home-manager = {
    users.pagu.home = {
      homeDirectory = "/home/pagu";
      username = "pagu";
    };
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
  };
  imports = [inputs.home-manager.nixosModules.home-manager];
}
