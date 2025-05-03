{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      lato
      nunito
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      # compat
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
        sansSerif = ["Nunito"];
        serif = ["Lato"];
      };
      subpixel.rgba = "rgb";
    };
  };
}
