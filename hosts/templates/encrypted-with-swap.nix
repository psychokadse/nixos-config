{ mainDevice, swapSize ? "32G", disko, ... }:

{
  imports = [ disko.nixosModules.disko ];
  disko.devices.disk.main = {
    type = "disk";
    device = mainDevice;
    content = {
      type = "gpt";
      partitions = {
        esp = {
          size = "1G";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };

        swap = {
          size = swapSize;
          content = {
            type = "luks";
            name = "cryptswap";
            content = { type = "swap"; };
          };
        };

        root = {
          size = "100%";
          content = {
            type = "luks";
            name = "cryptroot";
            content = {
              type = "btrfs";
              subvolumes = {
                "@" = { mountpoint = "/"; };
                "@nix" = { mountpoint = "/nix"; };
              };
            };
          };
        };
      };
    };
  };
  boot.loader = {
    systemd-boot.enable = false;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
    efi.canTouchEfiVariables = true;
  };
}
