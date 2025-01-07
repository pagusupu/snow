{pkgs, ...}: {
  boot = {
    loader = {
      grub = {
        enable = true;
        configurationLimit = 5;
        device = "nodev";
        efiSupport = true;
        splashImage = null;
        useOSProber = true;
      };
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      availableKernelModules = [ "ahci" "nvme" "sd_mod" "usb_storage" "usbhid" "xhci_pci" ];
      supportedFilesystems.btrfs = true;
    };
    supportedFilesystems.ntfs = true;
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelModules = [ "amd_pstate" "amdgpu" "kvm-amd" ];
    kernelParams = [ "amd_pstate=guided" ];
  };
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [ libvdpau-va-gl vaapiVdpau ];
    };
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };
  powerManagement.cpuFreqGovernor = "schedutil";

  /*
     fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
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
  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];
  */
}
