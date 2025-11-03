{pkgs, ...}: {
  fonts = {
    packages = with pkgs;
      [
        adwaita-fonts
        lato
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
      ]
      ++ (with pkgs.nerd-fonts; [
        jetbrains-mono
        symbols-only
      ]);
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["JetBrainsMono Nerd Font"];
        sansSerif = ["Adwaita sans"];
        serif = ["Lato"];
      };
      subpixel.rgba = "rgb";
    };
  };
}
