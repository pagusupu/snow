{pkgs, ...}: {
  boot = {
    loader = {
      timeout = 0;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    swraid = {
      enable = true;
      mdadmConf = "MAILADDR please@shut.up";
    };
    initrd = {
      availableKernelModules = ["ahci" "nvme" "sd_mod" "xhci_pci"];
      supportedFilesystems.btrfs = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = ["irqpoll" "fsck.mode=force"];
    kernelModules = ["kvm-amd"];
  };
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };
  powerManagement.cpuFreqGovernor = "powersave";

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };
    "/" = {
      device = "/dev/disk/by-label/main";
      fsType = "btrfs";
    };
    "/storage" = {
      device = "/dev/disk/by-label/storage";
      fsType = "btrfs";
    };
  };
  swapDevices = [{device = "/dev/disk/by-label/swap";}];
}
