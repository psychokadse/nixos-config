{ home-manager, disko, ... }: {
  imports = [
    (import ./templates/encrypted-with-swap.nix {
      mainDevice = "/dev/sda";
      swapSize = "8G";
      inherit disko;
    })
    home-manager.nixosModule.home-manager
  ];

  system.stateVersion = "25.05";
}
