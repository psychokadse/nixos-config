{ home-manager, disko, ... }: {
  imports = [
    (import ./templates/encrypted-with-swap.nix {
      mainDevice = "/dev/nvme0n1";
      swapSize = "32G";
      inherit disko;
    })
    home-manager.nixosModule.home-manager
  ];

  system.stateVersion = "25.05";
}
