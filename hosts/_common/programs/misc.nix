{pkgs, ...}: {
  home-manager.users.pagu = {
    home.packages = with pkgs; [
      feishin
    ];
    programs.mpv.enable = true;
    services.trayscale.enable = true;
  };
  programs.localsend.enable = true;
}
