{pkgs, ...}: {
  home-manager.users.pagu = {
    home.packages = with pkgs; [
      adwsteamgtk
      bitwarden-desktop
      feishin
      obsidian
    ];
    programs.mpv.enable = true;
    services.trayscale.enable = true;
  };
  programs.localsend.enable = true;
}
