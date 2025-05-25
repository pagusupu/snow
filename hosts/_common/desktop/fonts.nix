{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      lato
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only

      dejavu_fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      noto-fonts-extra
    ];
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
