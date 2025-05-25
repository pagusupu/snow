{pkgs, ...}: {
  home-manager.users.pagu = {
    home.packages = with pkgs; [
      celluloid
      feishin
      radeontop
    ];
    programs.mpv.enable = true;
    services.trayscale.enable = true;
  };
  programs = {
    goldwarden.enable = true;
    localsend.enable = true;
  };
}
