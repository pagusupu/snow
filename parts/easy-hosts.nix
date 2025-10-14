{inputs, ...}: {
  easy-hosts = {
    hosts = {
      rin.modules = [../modules/desktop];
    };
    shared = {
      modules = with inputs; [
        ../modules/shared
        home-manager.nixosModules.home-manager
        hosts.nixosModule
      ];
      specialArgs = {inherit inputs;};
    };
    path = ../hosts;
  };
}
