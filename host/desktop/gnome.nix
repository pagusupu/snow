{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
    displayManager.defaultSession = "gnome";
  };

  environment = {
    systemPackages = with pkgs;
      [
        evince
        gnome-calculator
        gnome-system-monitor
        gnome-tweaks
        loupe
        nautilus
        seahorse
        sushi
      ]
      ++ (with pkgs.gnomeExtensions; [
        appindicator
        fullscreen-avoider
      ]);
    gnome.excludePackages = with pkgs; [gnome-tour];
  };
  services = {
    gnome.core-utilities.enable = false;
    xserver.excludePackages = [pkgs.xterm];
  };

  nixpkgs.overlays = [
    (final: prev: {
      mutter = prev.mutter.overrideAttrs (_oldAttrs: {
        src = final.fetchFromGitLab {
          domain = "gitlab.gnome.org";
          owner = "vanvugt";
          repo = "mutter";
          rev = "triple-buffering-v4-47";
          hash = "sha256-ajxm+EDgLYeqPBPCrgmwP+FxXab1D7y8WKDQdR95wLI=";
        };
        preConfigure = let
          gvdb = final.fetchFromGitLab {
            domain = "gitlab.gnome.org";
            owner = "GNOME";
            repo = "gvdb";
            rev = "2b42fc75f09dbe1cd1057580b5782b08f2dcb400";
            hash = "sha256-CIdEwRbtxWCwgTb5HYHrixXi+G+qeE1APRaUeka3NWk=";
          };
        in ''cp -a "${gvdb}" ./subprojects/gvdb'';
      });
    })
  ];

  boot = {
    initrd = {
      systemd = {
        enable = true;
        services = {
          "autovt@tty1".enable = false;
          "getty@tty1".enable = false;
          systemd-udev-settle.enable = false;
        };
        network.wait-online.enable = false;
      };
      verbose = true;
    };
    plymouth.enable = true;
  };
}
