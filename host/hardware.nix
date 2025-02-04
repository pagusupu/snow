{pkgs, ...}: {
  boot = {
    loader = {
      grub = {
        enable = true;
        configurationLimit = 5;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
      efi.canTouchEfiVariables = true;
    };

    initrd.supportedFilesystems.btrfs = true;
    supportedFilesystems.ntfs = true;

    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = ["amd_pstate=guided"];
    kernelModules = ["amd_pstate" "amdgpu" "kvm-amd"];
    initrd.availableKernelModules = ["ahci" "nvme" "sd_mod" "usb_storage" "usbhid" "xhci_pci"];
  };
  powerManagement.cpuFreqGovernor = "schedutil";

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [libvdpau-va-gl vaapiVdpau];
    };
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
    xone.enable = true;
  };

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
