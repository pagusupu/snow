{inputs, ...}: {
  home-manager = {
    users.pagu.home = rec {
      homeDirectory = "/home/${username}";
      username = "pagu";
    };
    extraSpecialArgs.inputs = inputs;
    useGlobalPkgs = true;
    useUserPackages = true;
  };
  imports = [ inputs.home-manager.nixosModules.home-manager ];
}
