{ home-manager, disko, ... }:
let
  diskLayout = import ./templates/encrypted-with-swap.nix {
    inherit disko;
    mainDevice = "/dev/nvme0n1";
    swapSize = "32G";
  };
in {
  imports = [
    disko.nixosModules.disko
    diskLayout
    home-manager.nixosModules.home-manager
  ];

  fileSystems = diskLayout.fileSystems;
  swapDevices = diskLayout.swapDevices;

  system.stateVersion = "25.05";
}
