{inputs, ...}: {
  home-manager = {
    users.pagu.home = {
      homeDirectory = "/home/pagu";
      username = "pagu";
    };
    extraSpecialArgs.inputs = inputs;
    useGlobalPkgs = true;
    useUserPackages = true;
  };
  imports = [ inputs.home-manager.nixosModules.home-manager ];
}
