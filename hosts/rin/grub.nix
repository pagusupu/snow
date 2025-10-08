{pkgs, ...}: {
  boot.loader = {
    grub = {
      enable = true;
      configurationLimit = 5;
      device = "nodev";
      efiSupport = true;
      font = "${pkgs.lato}/share/fonts/lato/Lato-Regular.ttf";
      fontSize = 24;
      gfxmodeEfi = "1920x1080";
      splashImage = null;
      theme = pkgs.sleek-grub-theme.override {
        withBanner = ":3";
        withStyle = "dark";
      };
      extraEntries = ''
        menuentry "Windows 11" --class windows {
          insmod part_gpt
          insmod fat
          search --fs-uuid --set=root 3252-2b09
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }
      '';
    };
    efi.canTouchEfiVariables = true;
    timeout = 3;
  };
}
