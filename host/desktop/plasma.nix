{pkgs, ...}: {
  services.desktopManager.plasma6.enable = true;
  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      kate
      khelpcenter
      krdp
      plasma-browser-integration
      plasma-workspace-wallpapers
    ];
    etc."startscript".source = pkgs.writeShellScript "startscript" ''
      steam -silent -console &
      sudo tailscale up &
      trayscale --hide-window &
    '';
  };
}
