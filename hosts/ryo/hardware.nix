{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 1;
      };
      timeout = 0;
      efi.canTouchEfiVariables = true;
    };

    initrd.supportedFilesystems.btrfs = true;
    supportedFilesystems.ntfs = true;

    kernelModules = ["amdgpu" "kvm-amd"];
    initrd.availableKernelModules = ["nvme" "sd_mod" "sdhci_pci" "usb_storage" "xhci_pci"];
  };
  powerManagement.cpuFreqGovernor = "powersave";

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [libvdpau-va-gl vaapiVdpau];
    };
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };
  services.fprintd.enable = true;

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "btrfs";
    };
  };
  swapDevices = [{device = "/dev/disk/by-label/swap";}];
}
