{pkgs, ...}: {
  boot = {
    initrd.supportedFilesystems.btrfs = true;
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = ["amd_pstate=guided"];
    kernelModules = ["amd_pstate" "amdgpu" "kvm-amd"];
    initrd.availableKernelModules = ["ahci" "nvme" "sd_mod" "usb_storage" "usbhid" "xhci_pci"];
  };
  powerManagement.cpuFreqGovernor = "schedutil";

  security = {
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = false;
    };
    tpm2.enable = true;
  };

  hardware = {
    graphics = {
      enable = true;
      extraPackages = [pkgs.libvdpau-va-gl];
    };
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
    xone.enable = true;
  };
  time.hardwareClockInLocalTime = true;

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "btrfs";
    };
    "/games" = {
      device = "/dev/disk/by-label/games";
      fsType = "btrfs";
    };
  };
  swapDevices = [{device = "/dev/disk/by-label/swap";}];
}
