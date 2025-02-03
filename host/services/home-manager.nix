{inputs, ...}: {
  home-manager = {
    users.pagu.home = {
      homeDirectory = "/home/pagu";
      username = "pagu";
      stateVersion = "23.05";
    };
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
  };
  imports = [ inputs.home-manager.nixosModules.home-manager ];
}
