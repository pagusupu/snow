{
  inputs,
  pkgs,
  config,
  ...
}: {
  services.tailscale.extraUpFlags = ["--ssh"];
  networking.domain = "pagu.page";

  imports = [inputs.agenix.nixosModules.default];
  environment.systemPackages = [inputs.agenix.packages.${pkgs.system}.default];
  age.identityPaths = ["/etc/ssh/${config.networking.hostName}_ed25519_key"];

  home-manager.users.pagu = {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
        theme_background = false;
        proc_sorting = "name";
        proc_tree = true;
        proc_left = true;
        proc_filter_kernel = true;
        show_io_stat = false;
        show_battery = false;
      };
    };
  };
}
