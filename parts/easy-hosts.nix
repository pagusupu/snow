{inputs, ...}: {
  easy-hosts = {
    hosts = {
      aoi = {
        modules = [
          ../modules/server.nix
          inputs.home-manager-stable.nixosModules.home-manager
        ];
        nixpkgs = inputs.stable;
        # deployable = true;
      };
      rin.modules = [
        ../modules/desktop
        inputs.home-manager.nixosModules.home-manager
      ];
    };
    shared.modules = [../modules/shared];
    path = ../hosts;
  };
}
